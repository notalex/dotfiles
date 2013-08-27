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

function! s:RunFocusedTestInSplit()
  call system("tmux send-key -t 1 'exit' Enter 2> /dev/null")
  call system('tmux split-window')
  call system("tmux send-key -t 1 'rspec " . s:FocusedTestName() . "' Enter")
  call system("tmux select-pane -t 0")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'rspec " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap ;rt :call <SID>RunFocusedTest()<CR>
nmap ;rs :call <SID>RunFocusedTestInSplit()<CR>
nmap ;a :call <SID>RunTest()<CR>
