let s:file_name = expand('%:t:r')

if s:file_name =~ '\v_(test|spec)$'
  if exists('g:rspec_projects_pattern') && getcwd() =~ g:rspec_projects_pattern
    set filetype=rspec
  else
    set filetype=minitest
  endif
endif
