return {
  { -- Setup of the Mason plugin to manage the language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  { -- Bridge of Mason with lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("plugins.linter.mason-nvim")
    end,
  },

  -- { -- Neodev to enhances Lua LSP with Neovim API definitions
  --   "folke/neodev.nvim",
  --   lazy = false,
  --   opts = {},
  -- },

  {
    -- LSP config (mantido para outros servidores)
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("lspconfig")
      require("plugins.linter.lsp")
    end,
  },

  { -- Plugin to help me configure custom language servers
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.linter.nvim-lint")
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
      require("plugins.linter.nvim-cmp")
    end,
  },

  { -- Syntax Highlighting and a lot more
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    run = ":TSUpdate",
    config = function()
      require("plugins.linter.treesitter")
    end,
  },

  { -- Useful plugin for analyzing errors
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = require("plugins.linter.trouble")
  },

  { -- Create a float window with a preview of code actions
    "aznhe21/actions-preview.nvim",
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("plugins.linter.tsls-tools")
    end
  },
}
