return {
  { -- Setup of the Mason plugin to manage the language servers
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  { -- Bridge of Mason with lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    lazy = false,
    config = function()
      require("plugins.lsp.mason-nvim")
    end,
  },

  { -- Neodev to enhances Lua LSP with Neovim API definitions
    "folke/neodev.nvim",
    opts = {},
  },

  { -- LSP config to configure the language servers
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    config = function()
      require("plugins.lsp.config")
    end,
  },

  { -- Autocompletion framework
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    config = function()
      require("plugins.lsp.nvim-cmp")
    end,
  },

  { -- Syntax Highlighting and a lot more
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = false,
    config = function()
      require("plugins.lsp.treesitter")
    end,
  },

  { -- Useful plugin for analyzing errors
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = require("plugins.lsp.trouble")
  },
}
