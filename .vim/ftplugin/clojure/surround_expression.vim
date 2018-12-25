function! s:SurroundExpression()
  execute "normal! $i)\<Esc>0i("
  call feedkeys('a')
endfunction

nmap <F6>( :call <SID>SurroundExpression()<CR>
