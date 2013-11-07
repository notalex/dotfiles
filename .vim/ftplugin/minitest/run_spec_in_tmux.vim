"function! s:FocusedTestName()
  "" Since search backwards excludes current line, use j to move down first.
  "normal! j
  "let s:line_no = search('\sit.\+do$', 'bn')
  "normal! k

  "if s:line_no
    "let s:text = getline(s:line_no)
    "return matchstr(s:text, '\v(\w+ )+\w+')
  "endif
"endfunction

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

  if s:SporkPresent()
    call system("tmux send-key -t 1 'testdrb " . expand('%:.') . "' Enter")
  else
    call system("tmux send-key -t 1 'ruby -I" . s:TestHelperPath() . " " . expand('%:.') . "' Enter")
  endif

  call system("tmux last-pane")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'testdrb " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap <F7>rs :call <SID>RunTestInSplit()<CR>
nmap <F7>rt :call <SID>RunTest()<CR>
