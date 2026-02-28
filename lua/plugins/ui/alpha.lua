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

}

require("alpha").setup({
  layout = dashboard.opts.layout,
  layout_config = dashboard.opts.layout_config,
})
