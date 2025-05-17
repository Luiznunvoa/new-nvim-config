local custom_gruvbox = require("lualine.themes.gruvbox")
custom_gruvbox.normal.a.bg = "#fabd2f"
custom_gruvbox.insert.a.bg = "#fb4934"

custom_gruvbox.replace.a.bg = "#d3869b"

custom_gruvbox.visual.a.bg = "#83a598"

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = " " },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        color = { gui = "bold" },
      },
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      "diff",
      "diagnostics",
    },
    lualine_c = {
      {
        "filename",
        symbols = {
          modified = "[]",
          readonly = "[]",
          unnamed = "[?]",
          newfile = "[]",
        },
        path = 1
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {
      {
        "fileformat",
        symbols = { unix = " unix", dos = " dos", mac = " mac" },
      },
    },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
