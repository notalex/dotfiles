function! s:FocusedTestName()
  let s:focused_test_name = expand('%:p') . ':' . line('.')
  return s:focused_test_name
endfunction

function! s:Notification()
  return "; notify-send -u critical Done"
endfunction

function! s:RunFocusedTest()
  call system("tmux send-key -t 7 'cucumber " . s:FocusedTestName() . s:Notification() . "' Enter")
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'cucumber " . expand('%:p') . s:Notification() . "' Enter")
endfunction

nmap ;r :call <SID>RunFocusedTest()<CR>
nmap ;a :call <SID>RunTest()<CR>
