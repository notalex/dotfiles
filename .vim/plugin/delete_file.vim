function! s:DeleteCurrentFile()
  let directory_path = expand('%:p:h')
  call delete(expand('%'))
  bdelete!

  if !len(systemlist('ls ' . directory_path))
    call system('rm -rf ' . directory_path)
  endif
endfunction

command! DeleteCurrentFile call <SID>DeleteCurrentFile()
