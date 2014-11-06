" bogin
" Version: 0.0.1
" Author: @supermomonga
" License: MIT

if exists('g:loaded_bogin')
  finish
endif
let g:loaded_bogin = 1

let s:save_cpo = &cpo
set cpo&vim



let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
