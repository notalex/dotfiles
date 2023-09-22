function! OpenLinkInBrowser()
  let pattern = '\v(http|www)[^ >]+'
  let url = matchstr(getline('.'), pattern)

  if strlen(matchstr(url, '\v^(http|www)'))
    call system($BROWSER . ' ' . shellescape(url))
    return 'opened ' . url
  endif
endfunction

let g:last_visited_tab = 1
au! TabLeave * let g:last_visited_tab = tabpagenr()
nmap gl :execute "tabn" . g:last_visited_tab <CR>

"----------------------------------------------
nmap <F6>p o<Esc>p
nnoremap <F6>q /:\w* =><cr>xelvec:<Esc>:w<cr>
nmap <F6>O :echom OpenLinkInBrowser()<cr>
nmap <F6>o I<C-m><C-m><Esc>2ka
nmap <F6>dg Orequire 'debugger'; debugger; true<Esc>:w<CR>
nmap <F6>' cs"'
