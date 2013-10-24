function! s:RunTest()
  call delete('a.out')
  call system("tmux send-key -t 1 'exit' Enter 2> /dev/null")
  call system('tmux split-window')
  call system("tmux send-key -t 1 'g++ " . expand('%:p') . "' Enter")
  call system("tmux send-key -t 1 ./a.out Enter")
  call system("tmux select-pane -t 0")
endfunction

nmap <F7>rs :call <SID>RunTest()<CR>
