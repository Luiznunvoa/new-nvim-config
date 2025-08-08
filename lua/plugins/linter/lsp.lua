local lspconfig = require("lspconfig")

-- INFO: Lua Config
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Neovim usa LuaJIT
      },
      diagnostics = {
        globals = { "vim" }, -- Evita avisos sobre 'vim' indefinido
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Adiciona arquivos do runtime do Neovim
        checkThirdParty = false,                           -- Evita prompts desnecessários
      },
      telemetry = {
        enable = false, -- Desabilita envio de dados
      },
    },
  },
})

-- INFO: Tailwind Config
lspconfig.tailwindcss.setup({
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {  "html", "html-eex","css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
})
