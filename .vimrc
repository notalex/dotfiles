set nocompatible
source ~/.rcvim/plugins
colorscheme dark-ruby
source ~/.rcvim/custom_highlighting

" #-----------------maps------------------

map <Space> a<Space><Esc>
" nerdcommenter binding
map <C-h> <Leader>c<space>

" #----------------nmaps---------------

nmap ;j i<CR><Esc>
nmap <F2> :NERDTreeToggle<CR>
nmap <F4> :NERDTreeFind<CR>
nmap B :CtrlPBuffer<CR>
nnoremap R :CtrlPUndo<CR>
nmap ;f :Note<Space>
nmap ;r :SearchNotes<Space>
nmap K :filetype detect<cr>
nmap ;v :Rview<Space>
nmap <c-y> :wa<CR>
nmap < <l
nmap > >l
nmap <C-z> <right>

" #---------------- imaps --------------------------
imap <c-y> <esc>:wa<CR>
" remap ctrl space to just space
imap <Nul> <Space>
" the default behaviour of C-h does not remove both braces() when the 1st is removed
imap <C-h> <Backspace>
imap <C-c> <Right>

" #----------------- cmaps --------------------------------

cmap <c-k> <Up>
cmap <c-j> <Down>
cmap <Nul> <Space>
cmap <C-o> <S-Tab>
cabbrev hv vertical topleft help
cmap <C-c> <Right>

" ------------------set------------------------------

set smartindent
set nobackup
set ignorecase
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set smartcase
set nowritebackup
set noswapfile
set ttimeoutlen=50
set wildignore+=app/assets/images/**,log/**,public/system/**
set cedit=<C-s>  " since <C-f> has to be cmapped to emulate emacs mode

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
nmap ;q /:\w* =><cr>xelvec:<Esc>:w<cr>

let g:lasttab = 1
nmap <c-a> :exe "tabn" .g:lasttab <CR>
au TabLeave * let g:lasttab = tabpagenr()

nmap ;a :Ack "" app <Left><Left><Left><Left><Left><Left>
nmap ;s :Ack "" <Left><Left>

nmap <C-e> :source ~/.vimrc<cr>:echomsg 'reloaded!'<cr>
map <c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap <C-x> d:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
