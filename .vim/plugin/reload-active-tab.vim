" $ sudo apt-get install xdotool
" pwd should be a root folder with js, coffee etc subfolders.
"
" Open a haml file with title set in a single line.
" run :AutoReloadBrowserTab.

let s:compiled_extensions = { 'haml': 'html', 'coffee': 'js', 'sass': 'css' }
let s:tempfile = '/tmp/vim-reload-active-tab-errors'

function! s:MakeDirectories()
  for directory in ['sass', 'css', 'coffee', 'js']
    silent! call mkdir(getcwd() . '/' . directory)
  endfor
endfunction

function! s:EchoErrors()
  if getfsize(s:tempfile) > 0
    echom join(readfile(s:tempfile), "\n")
    call delete(s:tempfile)
  endif
endfunction

function! s:CompileFileAndReloadTab()
  let file_path = expand('%:p')
  let b:extension = expand('%:e')
  let compiled_path = s:GetCompiledPath()

  if b:extension == 'haml'
    let command = 'haml ' . file_path . ' ' . compiled_path
  elseif b:extension == 'coffee'
    let command = 'coffee -o ' . compiled_path . ' ' . file_path
  elseif b:extension == 'sass'
    let command = 'sass --no-cache ' . file_path . ' ' . compiled_path
  endif

  call system(command . ' 2> ' . s:tempfile)
  call s:EchoErrors()

  let window_ids = system("xdotool search --name '^" . s:html_title . "'")

  if strlen(window_ids)
    let window_id = matchstr(window_ids, '\d\+')
    call system('xdotool key --window ' . window_id . ' F5')
  else
    call system('firefox -new-tab ' . s:main_html_path)
  endif
endfunction

function! s:ExtractTitle()
  let line_number = search('[<%]title', 'n')
  let content = getline(line_number)
  return matchlist(content, '\vtitle\s+((\w|\s)+)%([^\s]+title)*')[1]
endfunction

function! s:GetContainerDirectory()
  if b:extension == 'haml'
    return getcwd() . '/'
  elseif b:extension == 'coffee'
    return getcwd() . '/js/'
  elseif b:extension == 'sass'
    return getcwd() . '/css/'
  endif
endfunction

function! s:GetCompiledPath()
  let file_name = expand('%:t:r')
  let directory = s:GetContainerDirectory()
  let compiled_extension = get(s:compiled_extensions, b:extension)

  if b:extension == 'coffee'
    return directory
  else
    return directory . file_name . '.' . compiled_extension
  end
endfunction

function! s:SetupAutoReload()
  let b:extension = expand('%:e')
  let s:main_html_path = s:GetCompiledPath()
  let s:html_title = s:ExtractTitle()
  call s:MakeDirectories()

  augroup AutoReloader
    autocmd! BufWritePost *.haml,*.coffee,*.sass call s:CompileFileAndReloadTab()
  augroup END
endfunction

function! s:StopAutoReload()
  autocmd! AutoReloader
endfunction

command! AutoReloadBrowserTab call <SID>SetupAutoReload()
command! StopAutoReloadBrowserTab call <SID>StopAutoReload()
