function! s:GetSelectedText()
  let s:user_defined_yank = @@
  execute "normal! `<v`>y"
  let s:script_defined_yank = @@
  let @@ = s:user_defined_yank
  return s:script_defined_yank
endfunction

function! s:AddVmailContact()
  let s:current_folder = expand('%:p:h')
  let s:contacts_file_path = s:current_folder . '/vmail-contacts.txt'
  let s:selected_address = s:GetSelectedText()

  if filereadable(s:contacts_file_path)
    let s:existing_addresses = readfile(s:contacts_file_path)
    let s:updated_addresses = add(s:existing_addresses, s:selected_address)
    call writefile(s:updated_addresses, s:contacts_file_path)
  else
    call writefile([s:selected_address], s:contacts_file_path)
  endif
endfunction

vnoremap <F7>v :call <SID>AddVmailContact()<CR>
