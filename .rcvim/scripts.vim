function! OpenLinkInFirefox()
  let pattern = escape('(http|www)[^ ]+', '()+|')
  let url = matchstr(getline('.'), pattern)
  call system('firefox ' . shellescape(url))
endfunction

let g:last_visited_tab = 1
au! TabLeave * let g:last_visited_tab = tabpagenr()
nmap gl :execute "tabn" . g:last_visited_tab <CR>

function! s:GetSelectedText()
  let s:user_defined_yank = @@
  execute "normal! `<v`>y"
  let s:script_defined_yank = @@
  let @@ = s:user_defined_yank
  return s:script_defined_yank
endfunction

function! AddVmailContact()
  let s:contacts_file_path = $HOME . '/.vmail/default/vmail-contacts.txt'
  let s:selected_address = s:GetSelectedText()
  let s:existing_addresses = readfile(s:contacts_file_path)
  let s:updated_addresses = add(s:existing_addresses, s:selected_address)
  call writefile(s:updated_addresses, s:contacts_file_path)
endfunction
