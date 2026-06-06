return {
  { -- File tree
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.finder.tree")
    end,
  },

  -- {
  --   'stevearc/oil.nvim',
  --   ---@module 'oil'
  --   ---@type oil.SetupOpts
  --   opts = {},
  --   cmd = "Oil",
  --   event = "VeryLazy",
  --   dependencies = {
  --     {
  --       "echasnovski/mini.icons", opts = {}
  --     },
  --     {
  --       "nvim-tree/nvim-web-devicons"
  --     }
  --   },
  --   config = function()
  --     require("plugins.finder.nvim-oil")
  --   end
  --
  -- },

  { -- Useful plugin to show you pending key binds.
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require("plugins.finder.wich-key")
  },

  { -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8', -- version e tag conflitantes; tag tem precedência, removido version="*"
    dependencies = { "nvim-lua/plenary.nvim" },
    -- cmd = "Telescope",
    config = function()
      require("plugins.finder.telescope")
    end,
  },

  { -- Useful plugin for analyzing errors
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = require("plugins.finder.trouble")
  },
}
