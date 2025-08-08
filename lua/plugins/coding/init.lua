return {
  { -- Auto pairs
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("plugins.coding.autopairs")
    end,
  },

  { -- Useful plugin to comment and uncomment lines
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {}
  },

  { -- Utility to show the color represented by a hex
    'norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
    config = function()
      require("plugins.coding.colorizer-nvim")
    end
  },

  { -- Useful plugin to surround text
    "echasnovski/mini.surround",
    config = function()
      require("plugins.coding.surround")
    end
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
      require("plugins.coding.nvim-cmp")
    end,
  },

  { -- Syntax Highlighting and a lot more
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    run = ":TSUpdate",
    config = function()
      require("plugins.coding.treesitter")
    end,
  },

  { -- Create a float window with a preview of code actions
    "aznhe21/actions-preview.nvim",
  },
}
