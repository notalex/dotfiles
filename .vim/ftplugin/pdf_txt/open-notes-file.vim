function! s:NotesFileType()
  return matchlist(getline(1), '\vb:notes_ft\=([^ :]+)')[1]
endfunction

function! s:OpenNotesFile()
  execute 'vertical belowright split ' . $HOME . '/gitbasket/' . <SID>NotesFileType() . '.notes'
  set ft=notes
  wincmd w
endfunction

call <SID>OpenNotesFile()
