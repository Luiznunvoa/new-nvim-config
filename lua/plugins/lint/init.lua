return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins.lint.lsp")
    end,
  }
}
