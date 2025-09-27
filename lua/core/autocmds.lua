local aug         = vim.api.nvim_create_augroup
local aucmd       = vim.api.nvim_create_autocmd

-- Special tab sizes for C/C++/Java
local codeTabsGrp = aug("CodeTabs", { clear = true })
aucmd("FileType", {
  group    = codeTabsGrp,
  pattern  = { "c", "cpp", "java" },
  callback = function()
    vim.opt_local.tabstop    = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab  = true
  end,
})

-- Enter insert mode on terminal open
local termGrp = aug("TerminalSettings", { clear = true })
aucmd("TermOpen", {
  group   = termGrp,
  pattern = "*",
  command = "startinsert",
})

aucmd({ "bufread", "bufnewfile" }, {
  pattern = "*.dbml",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})
