function! s:CustomGrep()
  let user_input = input("Search: ", '. * public, ')

  if strlen(user_input)
    let regexp = '\v^([^ ]+ [^ ]+ [^ ]+) ([^ ]+)( .+)*$'
    let pattern_and_options = matchlist(user_input, regexp)

    let options_string = pattern_and_options[1]
    let grep_options = split(options_string, ' ')

    " txt,rb => *.{txt,rb,} | * => * (matches all)
    let filetypes = grep_options[1]
    if strlen(matchstr(filetypes, '^\w'))
      let type = '*.{' . grep_options[1] . ',}'
    else
      let type = filetypes
    endif

    let folder = grep_options[0]
    let exclude_dirs = '{.git,tmp,fixtures,coverage,cassettes,log,locales,' . grep_options[2] . '}'

    let pattern = pattern_and_options[2]
    let escaped_pattern = shellescape(pattern)
    let options = pattern_and_options[3]

    " grep -r pattern app --include=*.{rb,}
    silent execute "grep -Pr " . escaped_pattern . " " . folder .
      \' --exclude-dir=' . exclude_dirs .
      \' --include=' . type .
      \' --exclude-from=' . $HOME . '/.better-grep-exclusions' . options
    cw
    redraw!
  endif
endfunction

nmap <F6>s :echo <SID>CustomGrep()<cr>
