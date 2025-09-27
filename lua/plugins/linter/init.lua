return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "tailwindcss",
        "ts_ls",
        "pyright",
        "texlab",
        "bashls",
        "eslint",
        "clangd"
      },
      automatic_installation = true,
    }
  },

  {
    -- Using native vim.lsp.config (Neovim 0.11+)
    -- nvim-lspconfig is optional but provides compatibility
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
