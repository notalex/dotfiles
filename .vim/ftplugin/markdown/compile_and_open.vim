function! s:CompileAndOpenMarkdown()
  if strlen(matchstr(expand('%:p'), 'guides/source'))
    silent! cd guides/

    call system('rake guides:generate:html')
    call system('firefox output/' . expand('%:t:r') . '.html')
  end
endfunction

nmap <F6>rs :echo <SID>CompileAndOpenMarkdown()<CR>
