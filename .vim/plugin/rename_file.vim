function! s:rename_file(new_file_path)
  let previous_file = expand('#')
  execute 'saveas ' . a:new_file_path
  call delete(expand('#:p'))
  bd #
  call common_functions_lib#SetAlternateFile(previous_file)
endfunction

command! -nargs=1 -complete=file Rename call <SID>rename_file(<f-args>)

cabbrev ren Rename %:p
