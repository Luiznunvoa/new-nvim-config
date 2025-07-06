local dashboard = require("alpha.themes.dashboard")
local version_info = vim.version()
local version_str = string.format("v%d.%d.%d", version_info.major, version_info.minor, version_info.patch)

-- ASCII header
dashboard.section.header.val = {
  [[                                                                       ]],
  [[  ██████   █████                   █████   █████  ███                  ]],
  [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
  [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
  [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
  [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
  [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
  "  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ " .. version_str,
  [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
  [[                                                                       ]],
}

-- Dashboard buttons
dashboard.section.buttons.val = {
  dashboard.button("f", "* Create:       Start Editing a New File;", ":ene <BAR> startinsert <CR>"),
  dashboard.button("d", "* FileTree:     Open the File Tree Here;", ":edit .<CR>"),
  dashboard.button("s", "* Search:       Quick Search a File;", "<cmd>lua require('telescope.builtin').find_files()<CR>"),
  dashboard.button("c", "* Config:       Go to the Neovim configuration;", ":edit ~/.config/nvim/ | :edit ~/.config/nvim/init.lua<CR>"),
  dashboard.button("n", "* Notes:        Go to notes folder;", ":edit ~/Documents/Notes/"),
  dashboard.button("q", "* Quit:         Leave the editor;", ":qa<CR>"),
}

require("alpha").setup({
  layout = dashboard.opts.layout,
  layout_config = dashboard.opts.layout_config,
})
