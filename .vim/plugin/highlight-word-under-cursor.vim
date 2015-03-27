" Highlight all instances of word under cursor, when idle.
nnoremap <F6>/ :set nohlsearch<Bar>if AutoHighlightToggle()<Bar>set hlsearch<Bar>endif<CR>

function! AutoHighlightToggle()
  let @/ = ''

  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\v<' . expand('<cword>') . '>'
    augroup end
    setl updatetime=200
    return 1
  endif
endfunction
