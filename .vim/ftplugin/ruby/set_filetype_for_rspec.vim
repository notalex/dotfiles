let s:file_name = expand('%:r')

if strlen(matchstr(s:file_name, '_spec$'))
  set filetype=rspec
endif
