function! s:DeleteAllBuffers()
  let s:index = 1

  let s:count = 0

  while s:index <= bufnr('$')
    if bufloaded(s:index)
      let s:count += 1
      execute 'bdelete ' . s:index
    endif

    let s:index += 1
  endwhile

  return s:count - 1 . ' buffers deleted!'
endfunction

command! Bdall echom <SID>DeleteAllBuffers()
