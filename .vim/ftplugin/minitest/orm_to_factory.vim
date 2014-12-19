function! s:RisingCamelToSnakeCase()
  silent! %s/\v(:[a-z_]+)([A-Z]+)/\1_\l\2/g
endfunction

function! s:ConvertOrmToFactory()
  silent! %s/\v(\w+)\.create%(!|)\(/create(:\1, /
  silent! %s/\v([^:]:)([A-Z])([a-z]+)/\1\l\2\3/

  call <SID>RisingCamelToSnakeCase()
endfunction

command! OrmToFactory :call <SID>ConvertOrmToFactory()
