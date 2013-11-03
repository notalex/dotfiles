function! OpenLinkInFirefox()
  let pattern = '\v(http|www)[^ ]+'
  let url = matchstr(getline('.'), pattern)
  call system('firefox-open ' . shellescape(url))
  return 'opened ' . url
endfunction

let g:last_visited_tab = 1
au! TabLeave * let g:last_visited_tab = tabpagenr()
nmap gl :execute "tabn" . g:last_visited_tab <CR>
