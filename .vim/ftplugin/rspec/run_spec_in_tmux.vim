function! s:FocusedTestName()
  let s:focused_test_name = expand('%:p') . ':' . line('.')
  return s:focused_test_name
endfunction

function! s:Notification()
  return "; notify-send -u critical Done"
endfunction

function! s:RunTest()
  call system("tmux send-key -t 7 'rspec " . s:FocusedTestName() . s:Notification() . "' Enter")
endfunction

nmap ;r :call <SID>RunTest()<CR>
