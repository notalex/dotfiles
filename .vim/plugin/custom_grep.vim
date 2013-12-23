function! s:CustomGrep()
  let s:user_input = input("Search: ", '. * public, ')

  if strlen(s:user_input)
    let s:regexp = '\v^([^ ]+ [^ ]+ [^ ]+) ([^ ]+)( .+)*$'
    let s:pattern_and_options = matchlist(s:user_input, s:regexp)

    let s:pattern = s:pattern_and_options[2]
    let s:replaced_pattern = substitute(s:pattern, '\s', '.', 'g')
    let s:escaped_pattern = escape(s:replaced_pattern, '+()')


    let s:options_string = s:pattern_and_options[1]
    let s:grep_options = split(s:options_string, ' ')

    " txt,rb => *.{txt,rb,} | * => * (matches all)
    let s:filetypes = s:grep_options[1]
    if strlen(matchstr(s:filetypes, '^\w'))
      let s:type = '*.{' . s:grep_options[1] . ',}'
    else
      let s:type = s:filetypes
    endif

    let s:folder = s:grep_options[0]
    let s:exclude_dirs = '{.git,tmp,fixtures,coverage,cassettes,' . s:grep_options[2] . '}'
    let s:options = s:pattern_and_options[3]

    " grep -r pattern app --include=*.{rb,}
    silent execute "grep -Pr '" . s:escaped_pattern . "' " . s:folder .
      \' --exclude-from=' . $HOME . '/.better-grep-exclusions' .
      \' --exclude-dir=' . s:exclude_dirs .
      \' --include=' . s:type . s:options
    cw
    redraw!
  endif
endfunction

nmap <F6>s :echo <SID>CustomGrep()<cr>
