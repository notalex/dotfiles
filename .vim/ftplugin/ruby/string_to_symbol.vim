function! s:ConvertStringToSymbol()
  " Convert double quoted, non interpolated, single line strings.
  silent! %s/\v"([a-z0-9_ ]+)"/'\1'/g
  " Convert single quoted, no spaces strings into symbols.
  silent! %s/\v'([a-z0-9_]+)'/:\1/g
  " Convert hash with fat arrows and symbols into the  new syntax.
  silent! %s/\v:(\w*) \=\> (:|)(\w*)/\1: \2\3/g
endfunction

command! StringToSymbol :call <SID>ConvertStringToSymbol()
