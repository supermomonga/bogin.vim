
let s:V = vital#of('bogin')
let s:B = s:V.import('Vim.Buffer')
let s:BM = s:V.import('Vim.BufferManager')

let s:manager = s:VM.new()
let s:window  = 0

function! bogin#open_or_create()
  if s:window == 0
    let s:window  = s:manager.open('bogin_board', { 'range': 'all' })
  endif
  return s:window
endfunction
