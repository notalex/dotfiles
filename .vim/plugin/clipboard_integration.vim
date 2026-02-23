function! s:PasteFromClipboard()
  call setreg('s', system('~/bin/OS_paste'))
  normal! "sp
endfunction

function! s:PasteFromTmuxClipboard()
  call setreg('s', system('tmux show-buffer'))
  normal! "sp
endfunction

function! s:CopyToClipboard()
  let s:previous_yank = @"

  normal! `<v`>y
  call system('~/bin/OS_copy', getreg('"'))

  call setreg('"', s:previous_yank)
endfunction

nmap <F6>vt :call <SID>PasteFromTmuxClipboard()<CR>
nmap <F6>vv :call <SID>PasteFromClipboard()<CR>
vmap <C-c> :<C-u>call <SID>CopyToClipboard()<CR>
