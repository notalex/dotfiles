set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'L9'
Bundle 'FuzzyFinder'
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
Bundle 'notalex/snipmate.vim'
Bundle 'notalex/vim-ruby-run'
Bundle 'notalex/vim-strip-trailers'

filetype plugin on
colorscheme dark-ruby
map <CR> O<Esc>
map <c-o> o<Esc>
map <C-u> :undo<CR>
imap <C-u> <Esc>:undo<CR>
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
nmap ;a :cw<cr>:resize +20<cr>:noautocmd vimgrep // app/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap ;f :cw<cr>:resize +20<cr>:noautocmd vimgrep // fe*/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <C-y> :FufBuffer<CR>
nmap F :FufFile<CR>
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
map K :filetype detect<cr>
let g:lasttab = 1
nmap <c-a> :exe "tabn" .g:lasttab <CR>
au TabLeave * let g:lasttab = tabpagenr()
map r :redo<cr>
imap <C-t> _
imap <c-r> -
map R :R
nmap T :source ~/.vimrc<cr>:echomsg 'reloaded!'<cr>
nmap U .
nmap <C-d> :echo "stubbed"<cr>
map <c-z> :echo "stubbed"<cr>
imap <c-f> <C-o><right>
imap <c-b> <C-o><left>
imap <c-j> <c-n>
nmap <c-j> i<CR><Esc>
set smartindent
cmap <c-u> <Up>
cmap <c-y> <Down>
cmap <c-x> <delete>
cmap <c-a> <home>
cmap <c-b> <S-left>

" syntax  highlighting overrides
""""""""""""""""""""""""""""""""
hi VertSPlit cterm=none ctermfg=green guifg=lightgray
hi StatusLine ctermfg=green guifg=lightgray
hi Pmenu ctermfg=22 ctermbg=black
hi Underlined		ctermfg=grey	guifg=red	

hi rubyModule			ctermfg=5
hi rubyClass			ctermfg=5
hi rubySymbol			ctermfg=3
hi rubyBlock			ctermfg=darkgray             " map-each statements
hi rubyControl			ctermfg=40                 " do end blocks
hi rubyConditional		ctermfg=52               " if-case conditions
hi railsUserClass  ctermfg=4                   " Rails class variable names

" haml/html tag
hi htmlTagName	ctermfg=blue

" custom filetype & highlighting for notes
""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.notes setf notes

syntax region notesHyphen start=/^-/ end=/\n/
syntax region notesUnderscore start=/^_/ end=/\n/
syntax region notesAsterisk start=/^*/ end=/\n/
syntax region notesHash start=/#/ end=/\n/

hi notesUnderscore ctermfg=magenta
hi notesHyphen ctermfg=lightgreen
hi notesAsterisk ctermfg=lightblue
hi notesHash ctermfg=brown
