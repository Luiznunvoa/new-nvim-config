-- Inicializa Mason
require("mason").setup()

-- Garante instalação do lua_ls
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls" },
  -- automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- Configuração do lua_ls
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})
