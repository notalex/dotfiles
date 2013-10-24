function! s:FocusedTestName()
  let s:focused_test_name = expand('%:p') . ':' . line('.')
  return s:focused_test_name
endfunction

function! s:Notification()
  return "; notify-send -t 2000 Done"
endfunction

function! s:RunFocusedTest()
  call system("tmux send-key -t 7 'rspec " . s:FocusedTestName() . s:Notification() . "' Enter")
endfunction

function! s:SwitchOrCreateResultsPane()
  if system('tmux list-panes | wc -l') == 2
    call system('tmux select-pane -t 1')
  else
    call system('tmux split-window')
  endif
endfunction

function! s:RunFocusedTestInSplit()
  call s:SwitchOrCreateResultsPane()
  call system("tmux send-key -t 1 'rspec " . s:FocusedTestName() . "' Enter")
  call system("tmux select-pane -t 0")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'rspec " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap <F7>rt :call <SID>RunFocusedTest()<CR>
nmap <F7>rs :call <SID>RunFocusedTestInSplit()<CR>
nmap <F7>a :call <SID>RunTest()<CR>
