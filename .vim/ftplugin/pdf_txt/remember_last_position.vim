function! s:SaveCurrentPosition()
  let current_position = line('.')

  call writefile([current_position], <SID>PositionFileName())
endfunction

function! s:BaseFileName()
  return expand('%:t:r:r')
endfunction

function! s:PositionFileName()
  return $HOME . '/.vimpdf/positions/' . <SID>BaseFileName()
endfunction

function! s:RestorePreviousPosition()
  let position_filename = <SID>PositionFileName()

  if filereadable(position_filename)
    let current_position = readfile(position_filename)[0]

    execute 'normal! ' . current_position . 'gg'
  endif
endfunction

autocmd! BufWinLeave <buffer> call <SID>SaveCurrentPosition()

call <SID>RestorePreviousPosition()
