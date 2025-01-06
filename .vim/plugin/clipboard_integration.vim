function! s:PasteFromClipboard()
  call setreg('s', system(s:PasteCommand()))
  normal! "sp
endfunction

function! s:PasteFromTmuxClipboard()
  call setreg('s', system('tmux show-buffer'))
  normal! "sp
endfunction

function! s:CopyToClipboard()
  let s:previous_yank = @"

  normal! `<v`>y
  call system(s:CopyCommand(), getreg('"'))

  call setreg('"', s:previous_yank)
endfunction

function! s:CopyCommand()
   if has('mac')
     return 'pbcopy'
   else
     return 'xclip -i -selection clipboard'
   endif
endfunction

function! s:PasteCommand()
   if has('mac')
     return 'pbpaste'
   else
     return 'xclip -o -selection clipboard'
   endif
endfunction

nmap <F6>vv :call <SID>PasteFromTmuxClipboard()<CR>
nmap <F6>vc :call <SID>PasteFromClipboard()<CR>
vmap <C-c> :<C-u>call <SID>CopyToClipboard()<CR>
