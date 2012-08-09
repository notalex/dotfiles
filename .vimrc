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
Bundle 'tpope/vim-repeat'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/Specky'
Bundle 'vim-scripts/Auto-Pairs'
Bundle 'vim-scripts/BufOnly.vim'
Bundle 'vim-scripts/dark-ruby'
Bundle 'vim-scripts/utl.vim'
"Bundle 'vim-scripts/YankRing.vim'
"Bundle 'vim-scripts/Txtfmt-The-Vim-Highlighter'
Bundle 'xolox/vim-notes'
Bundle 'notalex/snipmate.vim'
Bundle 'notalex/vim-ruby-run'
Bundle 'notalex/vim-strip-trailers'

filetype plugin on
colorscheme dark-ruby

" #-----------------maps------------------

map <Space> a<Space><Esc>
" nerdcommenter binding
map <C-h> <Leader>c<space>

" #----------------nmaps---------------

nnoremap <C-F7> :vertical resize -5<cr>
nnoremap <C-F6> :resize +5<cr>
nnoremap <C-F5> :resize -5<cr>
nnoremap <C-F8> :vertical resize +5<cr>
nmap <CR> O<Esc>
nmap <c-j> i<CR><Esc>
nmap <C-F> :FufFile<CR>
nmap <C-B> :FufBuffer<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <F4> :NERDTreeFind<CR>
nmap F :Note 
nmap R :SearchNotes 
nmap K :filetype detect<cr>
nmap r :redo<cr>
nmap ;v :Rview 
nmap <c-y> :wa<CR>

" #---------------- imaps --------------------------
imap <c-y> <esc>:wa<CR>
imap <c-f> <Esc>la
imap <c-w> <C-o>:echo "stubbed"<cr>
imap <c-b> <C-o><left>
imap <c-j> <Esc>:echo "stubbed"<cr>
" remap ctrl space to just space
imap <Nul> <Space>
" the default behaviour of C-h does not remove both braces() when the 1st is removed
imap <C-h> <Backspace>
imap <c-a> <Home>
imap <C-e> <End>
imap <C-u> <C-o>:echo "stubbed"<cr>

" #----------------- cmaps --------------------------------

cmap <c-u> <Up>
cmap <c-y> <Down>
cmap <c-x> <delete>
cmap <c-a> <home>
" <C-e> cmapped to <End> by default
cmap <c-b> <S-left>
cmap <Nul> <Space>
cabbrev hv vertical topleft help

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

" -----------------scripts------------------
let g:lasttab = 1
nmap <c-a> :exe "tabn" .g:lasttab <CR>
au TabLeave * let g:lasttab = tabpagenr()

let NERDTreeShowHidden = 1

nmap ;a :cw<cr>:resize +20<cr>:noautocmd vimgrep // app/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap ;f :cw<cr>:resize +20<cr>:noautocmd vimgrep // fe*/** <Left><Left><Left><Left><Left><Left><Left><Left><Left>
nmap <C-e> :source ~/.vimrc<cr>:echomsg 'reloaded!'<cr>
map <c-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
map <c-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
vmap <C-x> d:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>

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

hi notesHyphen ctermfg=lightgreen

" #--------------------notes config------------------------------------------
  let g:notes_suffix = '.notes'
  let g:notes_directory = '~/gitbasket'
  hi notesTagName ctermfg=4
  hi notesBold ctermfg=14
  hi notesItalic ctermfg=12
  hi notesDoubleQuoted ctermfg=3
  hi notesSingleQuoted ctermfg=7
  hi notesXXX ctermfg=red
  hi notesBlockQuote ctermfg=lightgreen
  hi notesUnixPath ctermfg=yellow
  hi notesShortHeading ctermfg=red
