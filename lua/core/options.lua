-- Core editor options
local o                  = vim.opt

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- hide tabline
vim.opt.showtabline      = 0

-- optionally enable 24-bit colour
vim.opt.termguicolors    = true

-- Fonts and cursor
vim.g.have_nerd_font     = true
o.guicursor              = 'n-v-c:block,i:block'

-- Files
o.swapfile               = false -- NO MORE SWAP FILES
o.undofile               = true

-- Numbers
o.number                 = true
vim.wo.relativenumber    = false

-- Tabs and indent
o.tabstop                = 2
o.shiftwidth             = 2
o.expandtab              = true
o.smartindent            = true

-- Wrap
o.wrap                   = true
o.linebreak              = true

-- UI
o.cursorline             = true
o.termguicolors          = true
o.showmode               = false

-- Clipboard
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Sign column and update time
o.signcolumn            = 'yes'
o.updatetime            = 250

-- Spellcheck
o.spelllang             = 'en_us,pt'
o.spell                 = true

-- BarBar(tabs plugin) not auto setting up
vim.g.barbar_auto_setup = false

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
})

vim.diagnostic.config({
  virtual_text     = true,
  signs            = true,
  underline        = true,
  update_in_insert = false,
})

vim.cmd("syntax enable")

vim.cmd([[ autocmd TermOpen * startinsert ]])
