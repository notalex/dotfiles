set nocompatible
source ~/.rcvim/plugins
source ~/.rcvim/scripts.vim
source ~/.rcvim/autocommands
colorscheme dark-ruby
syntax on
source ~/.rcvim/custom_highlighting
source $VIMRUNTIME/macros/matchit.vim

" #-----------------maps------------------

" nerdcommenter binding
map <C-h> <Leader>c<space>

" #----------------nmaps---------------

nmap <CR> O<Esc>
nmap <Space> a<Space><Esc>
nmap <F7>nt :NERDTreeToggle<CR>
nmap <F7>nf :NERDTreeFind<CR>
nmap <F7>d :filetype detect<cr>
nmap <F7>j i<CR><ESC>
nmap <F7>hs :set hlsearch!<cr>
nmap <F7>bs :set scrollbind!<cr>
nmap <F7>e :edit!<cr>
nmap <F7>w :wa<CR>
nmap < <l
nmap > >l
nmap <C-z> <nop>
nmap K <nop>
nnoremap / /\v
nnoremap ? ?\v
" Avoid Ex mode
nmap Q <nop>

" #---------------- vmaps --------------------------

vmap K <nop>

" #---------------- imaps --------------------------
" remap ctrl space to just space
imap <Nul> <Space>
" Backward kills should be available in undo/redo stack
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
imap <F7>w <Esc>:wa<CR>

" #----------------- cmaps --------------------------------

cmap <c-k> <Up>
cmap <c-j> <Down>
cmap <Nul> <Space>
cmap <C-o> <S-Tab>
cabbrev hv vertical topleft help
cabbrev src source ~/.vimrc
cabbrev fn vertical topleft help function-list
cabbrev vb vertical sbuffer

" ------------------set------------------------------

set modelines=1
set smartindent
set nobackup
set ignorecase
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hidden
set smartcase
set nowritebackup
set noswapfile
set incsearch
set ttimeoutlen=50
set wildignore+=app/assets/images/**,log/**,public/system/**
set cedit=<C-s>  " since <C-f> has to be cmapped to emulate emacs mode
" add hyphen to keyword list
set iskeyword+=-
set iskeyword+=?

" #-----------emacs mode
imap <c-a> <Home>
imap <C-e> <End>
imap <c-f> <Right>
imap <c-b> <Left>

cmap <c-a> <home>
" <C-e> cmapped to <End> by default
cmap <c-f> <Right>
cmap <c-b> <Left>

" -----------------scripts------------------
nmap <F7>p o<Esc>p
nmap <F7>t 2ddo<Esc>k
nnoremap <F7>y I<C-m><C-m><Esc>2ki
nnoremap <F7>q /:\w* =><cr>xelvec:<Esc>:w<cr>
nmap <F7>s :echo CustomGrep()<cr>
nnoremap <F7>m /.delay<cr>ved$a.deliver<Esc>:w<cr>
nmap <F7>o :echom OpenLinkInFirefox()<cr>

map <F7>v :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap <C-x> d:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
