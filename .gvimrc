colorscheme jellybeans
set guioptions-=T      "Removes toolbar
set guioptions-=r      "Removes right scrollbar
set guioptions-=m
set guioptions-=L
map <c-q> :qa<Enter>
map <C-s> :x<Enter>
imap <C-s> <Esc>:x<Enter>

hi rubyControl			guifg=violet

nmap <C-e> :source ~/.gvimrc<cr>:echomsg 'reloaded!'<cr>
