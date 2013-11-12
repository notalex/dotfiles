function! s:PasteFromClipboard()
  call setreg('s', system('xclip -o -selection clipboard'))
  normal! "sp
endfunction

function! s:PasteFromTmuxClipboard()
  call setreg('s', system('tmux show-buffer'))
  normal! "sp
endfunction

function! s:CopyToClipboard()
  let s:previous_yank = @"

  normal! `<v`>y
  call system('xclip -i -selection clipboard', getreg('"'))

  call setreg('"', s:previous_yank)
endfunction

nmap <F6>vv :call <SID>PasteFromTmuxClipboard()<CR>
nmap <F6>vc :call <SID>PasteFromClipboard()<CR>
vmap <C-c> :<C-u>call <SID>CopyToClipboard()<CR>
