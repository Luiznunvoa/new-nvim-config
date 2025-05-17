require("mason-lspconfig").setup({
  ensure_installed  = {
    "lua_ls",
    "ts_ls",
    "jdtls",
    "pylsp",
    "clangd"
  },
  automatic_installation = true,
  automatic_enable       = false,
})
