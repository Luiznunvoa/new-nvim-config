return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins.lint.keymaps")
      require("plugins.lint.lsp")
    end,
  },


  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("plugins.lint.tsls_tools")
    end
  },
}
