function! s:NotesFileType()
  return matchlist(getline(1), '\vb:notes_ft\=([^ :]+)')[1]
endfunction

function! s:CommentPattern()
  return matchlist(getline(1), '\vb:comment_pattern\=([^ :]+)')[1]
endfunction

function! s:WrapIntoSyntaxFold()
  normal! {
  call setline('.', '{{{' . <SID>NotesFileType())
  normal! }
  call setline('.', '}}}')
  normal! k
  write
endfunction

function! s:Comment()
  let contents = getline('.')
  let commented_contents = substitute(contents, '\v (\w|\{)', ' ' . b:comment_pattern . ' \1', '')
  call setline('.', commented_contents)
endfunction

function! s:SetBufferVariables()
  let b:notes_ft = <SID>NotesFileType()
  let b:comment_pattern = <SID>CommentPattern()
endfunction

nmap <F6>[ :call <SID>WrapIntoSyntaxFold()<CR>
nmap <C-h> :call <SID>Comment()<CR>

call <SID>SetBufferVariables()
