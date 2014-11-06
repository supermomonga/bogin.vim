

function! bogin#is_playing()
  if bufexists('bogin_board')
    return 1
  else
    return 0
  endif
endfunction

function! bogin#open_or_create()
  if !bogin#is_playing()
    call s:BM.open('bogin_board')
  endif
  setlocal filetype=bogin_board
  setlocal buftype=nofile
  setlocal nonumber
  setlocal ambiwidth=double
  call bogin#draw()
endfunction

function! bogin#close()
  if exists('s:window')
    unlet s:window
  endif
endfunction

function! bogin#move()
  let winnr = bufwinnr(bufnr('bogin_board'))
  if winnr != -1
    execute winnr . 'wincmd w'
    return 1
  else
    return 0
  endif
endfunction

function! bogin#draw()
  if bogin#move()
    normal! gg
    setlocal modifiable
    silent % delete _

    " TODO: It's ugly so create Board object and implement to_s method.
    silent put = '┌─────────┐'
    for row in range(1,9)
      let line = ''
      let line = line . '│'
      for column in range(1,9)
        let line = line . '歩'
      endfor
      let line = line . '│'
      silent put = line
    endfor
    silent put = '└─────────┘'

    setlocal nomodifiable
  endif
endfunction

function! bogin#_debug()
  echo s:window
endfunction

let s:V = vital#of('bogin')
let s:B = s:V.import('Vim.Buffer')
let s:BM = s:V.import('Vim.BufferManager').new()
call s:BM.config({
      \   'range' : 'tabpage',
      \   'opener' : 'tabnew'
      \ })
