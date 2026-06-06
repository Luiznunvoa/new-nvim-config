-- Core editor options
local o               = vim.opt
local g               = vim.g

g.loaded_netrw        = 1
g.loaded_netrwPlugin  = 1

-- hide tabline
vim.opt.showtabline   = 0
vim.opt.winborder      = "rounded"

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Fonts and cursor
g.have_nerd_font      = true
o.guicursor           = 'n-v-c:block,i:block'

-- Files
o.swapfile            = false -- NO MORE SWAP FILES
o.undofile            = true

-- Numbers
o.number              = true
vim.wo.relativenumber = true

-- Tabs and indent
o.tabstop             = 2
o.shiftwidth          = 2
o.expandtab           = true
o.smartindent         = true

-- Wrap
o.wrap                = true
o.linebreak           = true

-- UI
o.cursorline          = true
o.showmode            = true

-- Clipboard
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)

-- Sign column and update time
o.signcolumn        = 'yes'
o.updatetime        = 250

-- Spellcheck
o.spelllang         = 'en_us,pt'
o.spell             = true

-- BarBar(tabs plugin) not auto setting up
g.barbar_auto_setup = false

-- FIX: As duas chamadas separadas faziam a segunda sobrescrever a primeira,
-- descartando os ícones de sign (signs=false da 2ª chamada apagava os ícones).
-- Ref: :h vim.diagnostic.config() — cada nova chamada faz vim.tbl_deep_extend
-- com os valores anteriores, mas `signs=false` torna o campo um booleano,
-- descartando a sub-tabela `text` definida anteriormente.
vim.diagnostic.config({
  virtual_text    = false,       -- desativa mensagens inline permanentes
  signs           = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.INFO]  = " ",
      [vim.diagnostic.severity.HINT]  = " ",
    },
  },
  underline       = true,        -- ainda sublinha os erros
  update_in_insert = false,
  float = {
    scope  = "cursor",
    border = "rounded",
    source = "if_many",
    header = "🔎 Diagnostic:",
    format = function(diagnostic)
      local labels = {
        [vim.diagnostic.severity.ERROR] = "ERR",
        [vim.diagnostic.severity.WARN]  = "WARN",
        [vim.diagnostic.severity.INFO]  = "HINT",
      }
      local label = labels[diagnostic.severity] or "MSG"
      return string.format("[%s] %s (%s)", label, diagnostic.message, diagnostic.code)
    end,
  },
})

vim.cmd("syntax enable")
-- NOTE: TermOpen autocmd definido em core/autocmds.lua (removido daqui para evitar duplicata)
