function! s:SwitchOrCreateResultsPane()
  if system('tmux list-panes | wc -l') == 2
    call system('tmux select-pane -t 1')
  else
    call system('tmux split-window')
  endif
endfunction

function! s:RunTest()
  call delete('a.out')
  call s:SwitchOrCreateResultsPane()
  call system("tmux send-key -t 1 'g++ " . expand('%:p') . "' Enter")
  call system("tmux send-key -t 1 ./a.out Enter")
endfunction

nmap <F6>rs :call <SID>RunTest()<CR>
