function! s:CapitalizeSqlKeywords()
  let line_contents = getline('.')
  let sql_words = 'select|and|not|is|as|from|order|group|alter|update|insert|delete|into|asc|desc|by|between|distinct|exists|if|else|end|current_date|current_time|coalesce|contains|interval|left|outer|join'
  let pattern = '\v<(' . sql_words . ')>'
  let substituted_contents = substitute(line_contents, pattern, '\U\1', 'g')
  call setline(line('.'), substituted_contents)
endfunction

command! CapitalizeSqlKeywords call <SID>CapitalizeSqlKeywords()
