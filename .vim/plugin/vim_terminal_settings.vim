if has('nvim')
  finish
endif

augroup remap_ctrl_w_in_term
  autocmd!
  autocmd TerminalWinOpen * setlocal termwinkey=<C-L>
augroup END

" Always open terminal in current window
cnoreabbrev <expr> term getcmdtype() ==# ':' && getcmdline() ==# 'term' ? 'term ++curwin' : 'term'
