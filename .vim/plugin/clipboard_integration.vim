function! s:PasteFromClipboard()
  call setreg('s', system('xclip -o -selection clipboard'))
  normal! "sp
endfunction

function! s:CopyToClipboard()
  let s:previous_yank = @"

  normal! `<v`>y
  call system('xclip -i -selection clipboard', getreg('"'))

  call setreg('"', s:previous_yank)
endfunction

nmap <F7>vv :call <SID>PasteFromClipboard()<CR>
vmap <C-c> :<C-u>call <SID>CopyToClipboard()<CR>
