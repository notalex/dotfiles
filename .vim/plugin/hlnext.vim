" == Temporarily highlight line containing the current match for n/N keypress ===
" Credit: Damian Conway OSCON: https://www.youtube.com/watch?v=aHm36-na4-4&t=347s

nnoremap <silent> n n:call HLNext(0.4)<CR>
nnoremap <silent> N N:call HLNext(0.4)<CR>

function! HLNext(blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction
