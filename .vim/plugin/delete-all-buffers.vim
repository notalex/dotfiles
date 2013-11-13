function! s:DeleteAllBuffers()
  let l:index = 1

  let l:count = 0

  while l:index <= bufnr('$')
    if bufloaded(l:index)
      let l:count += 1
      execute 'bdelete ' . l:index
    endif

    let l:index += 1
  endwhile

  return l:count - 1 . ' buffers deleted!'
endfunction

command! Bdall echom <SID>DeleteAllBuffers()
