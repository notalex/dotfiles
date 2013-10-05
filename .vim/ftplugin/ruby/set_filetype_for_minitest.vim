let s:file_name = expand('%:p')

if strlen(matchstr(s:file_name, '_test.rb$'))
  set filetype=minitest
endif
