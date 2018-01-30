function! s:CustomGrep(folder_path)
  if !isdirectory(a:folder_path) | return a:folder_path . " doesn't exist" | endif

  let user_input = input("Search: ", a:folder_path . ' * public, ', 'file')

  if strlen(user_input)
    let regexp = '\v^([^ ]+ [^ ]+ [^ ]+) ([^ ]+)( .+)*$'
    let pattern_and_options = matchlist(user_input, regexp)

    let options_string = pattern_and_options[1]
    let grep_options = split(options_string, ' ')

    " txt,rb => *.{txt,rb,} | * => * (matches all)
    let filetypes = grep_options[1]
    if strlen(matchstr(filetypes, '^\w'))
      let type = '*.{' . grep_options[1] . ',}'
    else
      let type = filetypes
    endif

    let folder = grep_options[0]
    let exclude_dirs = '{' . grep_options[2] . s:LangExcludes() . '.shards,locales,.git,tmp,log,deps,node_modules}'

    let pattern = pattern_and_options[2]
    let escaped_pattern = shellescape(pattern)
    let options = pattern_and_options[3]

    " grep -r pattern app --include=*.{rb,}
    silent execute "grep -Pr " . escaped_pattern . " " . folder .
      \' --exclude-dir=' . exclude_dirs .
      \' --include=' . type .
      \' --exclude-from=' . $HOME . '/.better-grep-exclusions' . options
    cw
    redraw!
  endif
endfunction

function! s:LangExcludes()
  if filereadable('shard.yml')
    return 'lib,'
  elseif filereadable('Gemfile')
    return 'fixtures,coverage,cassettes,'
  elseif $PWD == $HOME
    return '.bundle,.bzr.log,.cache,.config,.gconf,.gem,.gimp*,.ICAClient,.launchpadlib,.local,.mozilla,.node*,.npm,.openshot,.pentadactyl,.PlayOnLinux,.rvm,.scm_breeze,.steam*,.thunderbird,.trash,plugged,.viminfo,.wine,.xsession*,.zsnes,books,databases,Documents,Downloads,experiments,game_roms,gitbasket,ICAClient,Music,projects,PlayOnLinux*,Softwares,Tools,Videos,'
  else
    return ''
  endif
endfunction

function! s:App()
  if isdirectory('src') | return 'src' | else | return 'app' | endif
endfunction

function! s:TestFolder()
  if isdirectory('spec') | return 'spec' | else | return 'test' | endif
endfunction

nmap <F6>ss :echo <SID>CustomGrep('.')<cr>
nmap <F6>sa :echo <SID>CustomGrep(<SID>App())<cr>
nmap <F6>sl :echo <SID>CustomGrep('lib')<cr>
nmap <F6>sm :echo <SID>CustomGrep(<SID>App() . '/models')<cr>
nmap <F6>sc :echo <SID>CustomGrep(<SID>App() . '/controllers')<cr>
nmap <F6>sv :echo <SID>CustomGrep(<SID>App() . '/views')<cr>
nmap <F6>sj :echo <SID>CustomGrep(<SID>App() . '/assets/javascripts')<cr>
nmap <F6>sd :echo <SID>CustomGrep(<SID>App() . '/assets/stylesheets')<cr>
nmap <F6>st :echo <SID>CustomGrep(<SID>TestFolder())<cr>
