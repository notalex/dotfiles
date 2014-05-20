highlight LongLineMatcher ctermbg = 235

function! s:ToggleLongLinesHighlight()
  if exists('s:matcher')
    call matchdelete(s:matcher)
    unlet s:matcher
  else
    let s:matcher = matchadd('LongLineMatcher', '\v%>70v.+')
  endif
endfunction

nmap <F6>ht :call <SID>ToggleLongLinesHighlight()<CR>

" Do not highlight long lines for Vmail or notes.
if !strlen($VMAIL_HOME) && index(['notes'], &ft) < 0
  call <SID>ToggleLongLinesHighlight()
endif
