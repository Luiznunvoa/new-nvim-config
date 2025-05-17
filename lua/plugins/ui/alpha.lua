local dashboard = require("alpha.themes.dashboard")

-- ASCII header
dashboard.section.header.val = {
  [[                                                                       ]],
  [[  ██████   █████                   █████   █████  ███                  ]],
  [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
  [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
  [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
  [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
  [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
  [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
  [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
  [[                                                                       ]],
}

-- Dashboard buttons
dashboard.section.buttons.val = {
  dashboard.button("f", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("d", "  Browse Files", ":edit .<CR>"),
  dashboard.button("s", "  Search Files", "<cmd>lua require('telescope.builtin').find_files()<CR>"),
  dashboard.button("c", "  Configuration", ":edit ~/.config/nvim/ | :edit ~/.config/nvim/init.lua<CR>"),
  dashboard.button("n", "󱞁  Notes", ":edit ~/Documents/Notes/"),
  dashboard.button("q", "󰿅  Quit Neovim", ":qa<CR>"),
}

require("alpha").setup({
  layout = dashboard.opts.layout,
  layout_config = dashboard.opts.layout_config,
})
