colorscheme dark-ruby 
map <CR> O<Esc>
map <c-o> o<Esc>
map <C-b> i<CR><Esc>
map <C-z> :u<CR>
imap <C-z> <Esc>:u<CR>
noremap <c-e> :wa<CR>
inoremap <c-e> <esc>:wa<CR>
vmap <C-c> "+y
vmap <C-x> "+x
map <C-v> "+gP
nnoremap <insert> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p 
vnoremap <c-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR> 
map H <c-_><c-_>
map <c-h> <c-_><space>#<cr>
map <c-l> <c-_><space>//<cr>
map L <c-_><space>
map <Space> a<Space><Esc>
map <tab> >l
map <s-tab> <l
map <c-f> :R
map <c-u> :cw<cr>:resize +20<cr>:noautocmd vimgrep // app/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <C-y> :FuzzyFinderBuffer<CR>
"map <C-a> :FuzzyFinderFile<CR>
map <F2> :NERDTreeToggle<CR>
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
map <c-t> :set syntax=
let g:lasttab = 1
nmap <c-a> :exe "tabn" .g:lasttab <CR>
au TabLeave * let g:lasttab = tabpagenr()
map r /_<cr>l
map R ?_<cr>l
nmap T :source ~/.vimrc<cr>:echomsg 'reloaded!'<cr>
nmap u :set cursorline!<cr>
nmap U .
