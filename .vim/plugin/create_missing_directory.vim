function! s:CreateMissingDirectories()
  if !filereadable(expand('%'))
    let directory_path = expand('%:p:h')

    if !isdirectory(directory_path)
      call mkdir(directory_path, 'p')
    end
  endif
endfunction

augroup CreateMissingDirectories
  autocmd!
  autocmd BufWritePre * call <SID>CreateMissingDirectories()
augroup END
