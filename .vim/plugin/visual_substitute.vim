function! s:VisualSubstitute()
  let l:content_list = run_live_lib#GetSelectedContentList()
  let l:new_content_list = ["  adapter pg"]

  for l:line in l:content_list
    let l:sline = substitute(l:line, '^\s\s', '', '')
    call add(l:new_content_list, l:sline)
  endfor

  let @x = join(l:new_content_list, "\n")
  normal! gvd
  normal! "xp
endfunction

" vnoremap <F6>vs :<c-u>call <SID>VisualSubstitute()<CR>
