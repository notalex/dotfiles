set nocompatible
source ~/.rcvim/plugins
source ~/.rcvim/scripts.vim
source ~/.rcvim/autocommands
colorscheme lotus
syntax on
source ~/.rcvim/custom_highlighting
source $VIMRUNTIME/macros/matchit.vim

" #-----------------maps------------------

" nerdcommenter binding
map <C-h> <Leader>c<space>

" #----------------nmaps---------------

nmap <CR> O<Esc>
nmap <Space> a<Space><Esc>
nmap <F6>nt :NERDTreeToggle<CR>
nmap <F6>nf :NERDTreeFind<CR>
nmap <F6>dt :filetype detect<cr>
nmap <F6>j i<CR><ESC>
nmap <F6>hs :set hlsearch!<cr>
nmap <F6>hc :set cursorline!<cr>
nmap <F6>bs :set scrollbind!<cr>
nmap <F6>e :edit!<cr>
nmap <F6>w :wa<CR>
nmap < <l
nmap > >l
nmap <C-z> <nop>
nmap K <nop>
nnoremap / /\v
nnoremap ? ?\v
" Avoid Ex mode
nmap Q <nop>

" ` is harder to reach than '
nnoremap ` '
nnoremap ' `

" #---------------- vmaps --------------------------

vmap K <nop>

" #---------------- imaps --------------------------
" remap ctrl space to just space
imap <Nul> <Space>
" Backward kills should be available in undo/redo stack
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
imap <F6>w <Esc>:wa<CR>
imap <F6> <Esc>

" #----------------- cmaps --------------------------------

cmap <c-k> <Up>
cmap <c-j> <Down>
cmap <Nul> <Space>
cabbrev hv vertical topleft help
cabbrev src source ~/.vimrc
cabbrev fn vertical topleft help function-list
cabbrev vb vertical sbuffer

" ------------------set------------------------------

set t_Co=256
set modelines=1
set autoindent
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
nmap <F6>p o<Esc>p
nmap <F6>t 2ddo<Esc>k
nnoremap <F6>q /:\w* =><cr>xelvec:<Esc>:w<cr>
nnoremap <F6>m /.delay<cr>ved$a.deliver<Esc>:w<cr>
nmap <F6>O :echom OpenLinkInFirefox()<cr>
nmap <F6>o I<C-m><C-m><Esc>2ka
nmap <F6>dg Odebugger; true<Esc>:w<CR>
