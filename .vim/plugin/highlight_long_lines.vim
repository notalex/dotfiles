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
" Cannot depend on filetypes since this is read before all syntax & ftplugins.
if !strlen($VMAIL_HOME) && expand('%:p:h:t') != 'gitbasket'
  call <SID>ToggleLongLinesHighlight()
endif
