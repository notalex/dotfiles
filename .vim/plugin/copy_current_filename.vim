function! s:CopyCurrentFilename()
  let l:filename = expand('%:t')
  call system('~/bin/OS_copy', l:filename)
endfunction

function! s:CopyCurrentFilePath()
  let l:filepath = expand('%')
  call system('~/bin/OS_copy', l:filepath)
endfunction

nmap <F6>cf :call <SID>CopyCurrentFilePath()<CR>
nmap <F6>cd :call <SID>CopyCurrentFilename()<CR>
