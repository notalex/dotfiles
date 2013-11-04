function! s:DeleteAllBuffers()
  let s:index = 1

  while s:index <= bufnr('$')
    if bufloaded(s:index)
      execute 'bdelete ' . s:index
    endif

    let s:index += 1
  endwhile
endfunction

command! Bdall call <SID>DeleteAllBuffers()
