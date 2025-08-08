return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    opts = function()
      require("plugins.lint.keymaps")
    end,
    config = function()
      require("plugins.lint.lsp")
    end,
  }
}
