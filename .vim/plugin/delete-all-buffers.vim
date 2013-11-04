function! s:DeleteAllBuffers()
  let index = 1

  while index <= bufnr('$')
    if bufloaded(index)
      execute 'bdelete ' . index
    endif

    let index += 1
  endwhile
endfunction

command! Bdall call <SID>DeleteAllBuffers()
