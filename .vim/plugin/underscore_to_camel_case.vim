function! s:UnderscoreToCamelCase()
  normal! %s/\v_(\w)/\U\1/gc
endfunction

command! UnderscoreToCamelCase call <SID>UnderscoreToCamelCase()
