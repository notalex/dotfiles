function! s:ConvertToSpecDsl()
  silent! %s/test '/it '
  silent! %s/\vdef (.+)$/it '\1' do/
  silent! %s/\vassert_nil (.+)/\1.must_be_nil
  silent! %s/\vassert_not_nil (.+)/\1.wont_be_nil
  silent! %s/\vassert (.+)\.include\? (.+)$/\1.must_include(\2)/c
  silent! %s/\vassert (.+)\.([^.]+\?)$/\1.must_be :\2/c
  silent! %s/\vassert !(.+)\.match(.+)$/\1.wont_match\2/c
  silent! %s/\vassert (.+)\.match(.+)$/\1.must_match\2/c
  silent! %s/\vassert_equal ([^,]+), ([^,]+)$/\2.must_equal \1/
  silent! %s/\vinclude\?(.+).must_equal true/must_include\1/c
  silent! %s/\v\.([^.]+)\?.must_equal true/.must_be :\1?/c
  silent! %s/assert_redirected_to/must_redirect_to
  silent! %s/assert_response/must_respond_with
endfunction

command! ConvertToSpecDsl call <SID>ConvertToSpecDsl()
