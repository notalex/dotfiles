nnoremap <F6>p :CtrlPMRUFiles<CR>

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 400
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 15
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_extensions = ['undo']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(tmp|log|public|node_modules|\.git|app\/assets\/images|app\/bootstrap|app\/cljs-runtime|\.shadow-cljs|deps|_build|coverage)$',
  \ 'file': '\v(\.keep|\.hex|\.sassc)',
  \ }

if getcwd() == $HOME
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
endif

let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-i>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-o>', '<up>'],
  \ 'PrtExpandDir()':       ['<c-k>'],
  \ }
