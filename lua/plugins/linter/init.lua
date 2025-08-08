return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("plugins.linter.keymaps")
      require("plugins.linter.lsp")
    end,
  },

  { -- Plugin to help me configure custom language servers
    "mfussenegger/nvim-lint",
    config = function()
      require("plugins.linter.nvim-lint")
    end,
  },
}
