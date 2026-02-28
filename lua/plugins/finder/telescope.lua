local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    prompt_prefix   = "󰁕 ",
    selection_caret = " ",
    path_display    = { "truncate" },
    preview = {
      treesitter = false,
    },
    mappings        = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<CR>"]  = actions.select_default,
      },
      n = {
        ["q"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "ivy",
    },
  },
  extensions = {
    -- INFO: Extensions here
  },
})