"function! s:FocusedTestName()
  "let s:line_no = search('\sit.\+do$', 'bn')

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

function! s:RunTestInSplit()
  call s:SwitchOrCreateResultsPane()
  call system("tmux send-key -t 1 'testdrb " . expand('%:p') . "' Enter")
  call system("tmux select-pane -t 0")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'testdrb " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap <F7>rs :call <SID>RunTestInSplit()<CR>
nmap <F7>rt :call <SID>RunTest()<CR>
