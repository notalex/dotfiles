if exists('g:loaded_jump_from_log')
  finish
else
  let g:loaded_jump_from_log = 1
endif

function! s:JumpFromLog()
  execute 'wincmd w'

  if line('.') == 1
    normal! G
  endif

  let l:line_no = search('\v\w+\.\w+:\d+', 'b')
  let l:line_contents = getline(l:line_no)
  let l:file_path_and_line_no = matchstr(l:line_contents, '\v([^ ]+:\d+)')
  let l:file_path = split(l:file_path_and_line_no, ':')[0]
  let l:line_no = split(l:file_path_and_line_no, ':')[1]
  execute 'wincmd p'
  execute 'edit +' . l:line_no . ' ' . l:file_path
endfunction

nnoremap <F6>hj :call <SID>JumpFromLog()<CR>
