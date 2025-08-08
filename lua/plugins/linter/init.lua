return {
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

  { -- Linter fo typescript
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("plugins.linter.tsls_tools")
    end
  },
}
