function! s:CapitalizeSqlKeywords()
  let line_contents = getline('.')
  let sql_words = 'and|not|is'
  let pattern = '\v<(' . sql_words . ')>'
  let substituted_contents = substitute(line_contents, pattern, '\U\1', 'g')
  call setline(line('.'), substituted_contents)
endfunction

command! CapitalizeSqlKeywords call <SID>CapitalizeSqlKeywords()
