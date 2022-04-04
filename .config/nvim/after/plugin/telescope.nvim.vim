nnoremap <c-p> :Telescope find_files<CR>
nnoremap <F6>b :Telescope buffers<CR>
nnoremap <F6>p :Telescope oldfiles cwd_only=1 <CR>

lua << EOF
  local actions = require("telescope.actions")
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<C-i>"]  = actions.move_selection_next,
          ["<C-o>"]  = actions.move_selection_previous,
          ["<C-n>"]  = actions.results_scrolling_down,
          ["<C-p>"]  = actions.results_scrolling_up,
          ["<Up>"]   = actions.preview_scrolling_up,
          ["<Down>"] = actions.preview_scrolling_down,
          ["<esc>"] = actions.close,
          ["<C-u>"] = false
        },
      },
  }}
EOF
