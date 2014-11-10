syntax region notesHyphen start=/^\s*-/ end=/\n/
syntax region notesAsterisk start=/^\s*\*/ end=/\n/

if match(expand('%'), '\.pdf\.txt$')
  hi notesCodeStart ctermfg=234 ctermbg=NONE
  hi notesCodeEnd   ctermfg=234 ctermbg=NONE
end
