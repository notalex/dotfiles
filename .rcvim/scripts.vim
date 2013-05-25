function! OpenLinkInFirefox()
  let pattern = escape('(http|www)[^ ]+', '()+|')
  let url = matchstr(getline('.'), pattern)
  call system('firefox ' . shellescape(url))
endfunction
