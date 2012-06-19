set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/Specky'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'vim-scripts/dark-ruby'
Bundle 'msanders/snipmate.vim'
Bundle 'notalex/vim-ruby-run'
Bundle 'notalex/vim-strip-trailers'

filetype plugin on
colorscheme dark-ruby
map <CR> O<Esc>
map <c-o> o<Esc>
map <C-b> i<CR><Esc>
map <C-z> :undo<CR>
imap <C-z> <Esc>:u<CR>
noremap <c-e> :wa<CR>
inoremap <c-e> <esc>:wa<CR>
vmap <C-c> "+y
vmap <C-x> "+x
map <C-v> "+gP
nnoremap <insert> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
vnoremap <c-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <c-h> <Leader>c<space>
vmap <c-h> <Leader>c<space>
map <Space> a<Space><Esc>
map <tab> >l
map <s-tab> <l
map <c-f> :R
map <c-u> :cw<cr>:resize +20<cr>:noautocmd vimgrep // fe*/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <C-y> :FuzzyFinderBuffer<CR>
"map <C-a> :FuzzyFinderFile<CR>
map <F2> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set ignorecase
set smartcase
nnoremap <C-F7> :vertical resize -5<cr>
nnoremap <C-F6> :resize +5<cr>
nnoremap <C-F5> :resize -5<cr>
nnoremap <C-F8> :vertical resize +5<cr>
set nobackup
set nowritebackup
set noswapfile
nmap <C-d> :bdelete
highlight Pmenu ctermfg=22 ctermbg=black
map K :filetype detect<cr>
let g:lasttab = 1
nmap <c-a> :exe "tabn" .g:lasttab <CR>
au TabLeave * let g:lasttab = tabpagenr()
map r /
map R ?
nmap T :source ~/.vimrc<cr>:echomsg 'reloaded!'<cr>
nmap u :set cursorline!<cr>
nmap U .
imap <c-w> <Esc>la
set smartindent

" sytax  highlighting overrides
""""""""""""""""""""""""""""""""
hi VertSPlit cterm=none ctermfg=green guifg=lightgray
hi StatusLine ctermfg=green guifg=lightgray

hi rubyModule			ctermfg=5
hi rubyClass			ctermfg=5
hi rubySymbol			ctermfg=3
hi rubyBlock			ctermfg=darkgray             " map-each statements
hi rubyControl			ctermfg=40                 " do end blocks
hi rubyConditional		ctermfg=52               " if-case conditions
hi railsUserClass  ctermfg=4                   " Rails class variable names

" haml/html tag
hi htmlTagName	ctermfg=blue
