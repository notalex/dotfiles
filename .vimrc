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
nmap ;nt :NERDTreeToggle<CR>
nmap ;nf :NERDTreeFind<CR>
nmap ;f :Note<Space>
nmap ;r :SearchNotes<Space>
nmap ;v :Rview<Space>
nmap ;d :filetype detect<cr>
nmap ;j i<CR><ESC>
nmap ;hs :set hlsearch!<cr>
nmap ;bs :set scrollbind!<cr>
nmap ;e :edit!<cr>
nmap ;w :wa<CR>
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
" the default behaviour of C-h does not remove both braces() when the 1st is removed
imap <C-h> <Backspace>
" Backward kills should be available in undo/redo stack
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
imap ;w <Esc>:wa<CR>

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
nmap ;p o<Esc>p
nmap ;t 2ddo<Esc>k
nnoremap ;y I<C-m><C-m><Esc>2k
nnoremap ;q /:\w* =><cr>xelvec:<Esc>:w<cr>
nmap ;s :Ack "" <Left><Left>
nnoremap ;m /.delay<cr>ved$a.deliver<Esc>:w<cr>
nmap ;o :call OpenLinkInFirefox()<cr>

map <c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap <C-x> d:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
