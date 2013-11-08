function! s:FocusedTestName()
  " Since search backwards excludes current line, use j to move down first.
  normal! j

  let l:it_line_no = search('\v\sit.+do$', 'bn', 1)
  let l:def_line_no = search('\v\s+def %(\w|_)+$', 'bn', 1)

  normal! k

  if l:it_line_no
    let l:line = getline(l:it_line_no)
    let l:method_name = matchlist(l:line, '\v"(.+)"')[1]
    let l:formatted_method_name = substitute(l:method_name, '\v\s', '.', 'g')
    return l:formatted_method_name
  elseif l:def_line_no
    let l:line = getline(l:def_line_no)
    let l:method_name = matchlist(l:line, '\v^\s*def (.+)$')[1]
    return l:method_name
  endif
endfunction

function! s:Notification()
  return "; notify-send -t 2000 Done"
endfunction

function! s:SwitchOrCreateResultsPane()
  if system('tmux list-panes | wc -l') == 2
    call system('tmux select-pane -t 1')
  else
    call system('tmux split-window')
  endif
endfunction

function! s:SporkPresent()
  return strlen(system('pidof spork'))
endfunction

function! s:TestHelperPath()
  let s:path = expand('%:.')
  return matchstr(s:path, '\v.*test\/')
endfunction

function! s:RunTestInSplit()
  call s:SwitchOrCreateResultsPane()

  " strlen(0) => 1
  if strlen(s:FocusedTestName()) > 1
    let l:test_name_option = '--name /' . s:FocusedTestName() . '/'
  else
    let l:test_name_option = ''
  end

  if s:SporkPresent()
    call system("tmux send-key -t 1 'testdrb " . expand('%:.') .
      \ ' -- '.  l:test_name_option . "' Enter")
  else
    call system("tmux send-key -t 1 'ruby -I" . s:TestHelperPath() . " " .
      \ expand('%:.') . " " . l:test_name_option . "' Enter")
  endif

  call system("tmux last-pane")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'testdrb " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap <F7>rs :call <SID>RunTestInSplit()<CR>
nmap <F7>rt :call <SID>RunTest()<CR>
