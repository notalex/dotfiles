highlight LongLineMatcher ctermbg = 235

" Private {{{
function! s:ToggleLongLinesHighlight()
  if exists('s:matcher')
    call matchdelete(s:matcher)
    unlet s:matcher
  else
    call <SID>HighlightLongLines()
  endif
endfunction

function! s:HighlightLongLines()
  let s:matcher = matchadd('LongLineMatcher', '\v%>100v.+')
endfunction

function! s:HighlightLongLinesAndSetMapping()
  call <SID>HighlightLongLines()
  nmap <buffer> <F6>ht :call <SID>ToggleLongLinesHighlight()<CR>
endfunction
" }}}

augroup LongHighlighter
  autocmd! BufCreate *.coffee,*.rb call <SID>HighlightLongLinesAndSetMapping()
augroup END
