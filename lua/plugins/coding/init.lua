return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
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
      "hrsh7th/cmp-nvim-lsp-signature-help", -- source usado em nvim-cmp.lua mas ausente nas deps
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

  -- NOTE: actions-preview.nvim removido daqui — declaração canônica com
  -- setup() está em plugins/linter/init.lua.

  { -- Treesitter: incremental parsing, highlighting, indentation and more
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- treesitter does not support lazy-loading
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("plugins.coding.treesitter")
    end,
  },
}
