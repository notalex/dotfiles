function! OpenLinkInFirefox()
  let pattern = escape('(http|www)[^ ]+', '()+|')
  let url = matchstr(getline('.'), pattern)
  call system('firefox-open ' . shellescape(url))
  return 'opened ' . url
endfunction

function! CustomGrep()
  let s:user_input = input("Search: ", '* . | ')

  if strlen(s:user_input)
    let s:pattern_and_options = split(s:user_input, '\s*|\s*')

    let s:pattern = s:pattern_and_options[1]
    let s:replaced_pattern = substitute(s:pattern, '\s', '.', 'g')
    let s:escaped_pattern = escape(s:replaced_pattern, '+()')


    let s:options_string = s:pattern_and_options[0]
    let s:grep_options = split(s:options_string, ' ')

    " txt,rb => *.{txt,rb,} | * => *.{*,} (matches all)
    let s:type = '*.{' . s:grep_options[0] . ',}'
    let s:folder = s:grep_options[-1]

    " grep -r app --include=*.*{rb,}
    silent execute "grep -r '" . s:escaped_pattern . "' " . s:folder . " --include=" . s:type
    cw
  endif
endfunction

let g:last_visited_tab = 1
au! TabLeave * let g:last_visited_tab = tabpagenr()
nmap gl :execute "tabn" . g:last_visited_tab <CR>
