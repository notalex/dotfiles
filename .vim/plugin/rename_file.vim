function! s:rename_file(new_file_path)
  execute 'saveas ' . a:new_file_path
  call delete(expand('#:p'))
  bd #
endfunction

command! -nargs=1 -complete=file Rename call <SID>rename_file(<f-args>)

let current_file_path = expand('%:p')
execute 'cabbrev ren Rename ' . current_file_path
