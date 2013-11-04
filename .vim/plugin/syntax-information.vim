function! s:SyntaxId()
  return synID(line('.'), col('.'), 1)
endfunction

" Display syntax highlighting group name of pattern under cursor
nmap <F7>cn :echo synIDattr(<SID>SyntaxId(), 'name')<CR>
nmap <F7>cf :echo synIDattr(<SID>SyntaxId(), 'fg')<CR>
