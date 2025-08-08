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

  { -- Useful plugin to show you pending key binds.
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require("plugins.finder.wich-key")
  },

  { -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    version = "*",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
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