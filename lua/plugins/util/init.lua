return {
  { -- File tree
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.util.tree")
    end,
  },

  { -- Auto pairs
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("plugins.util.autopairs")
    end,
  },

  { -- Useful plugin to show you pending key binds.
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = require("plugins.util.wich-key")
  },

  { -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    version = "*",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("plugins.util.telescope")
    end,
  },

  { -- Useful plugin to comment and uncomment lines
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {}
  },

  { -- Other utility to manipulate surrounded text
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  { -- Utility to run files and projects
    "CRAG666/code_runner.nvim",
    config = function()
      require("plugins.util.code-runner")
    end
  },

  { -- Utility to show the color represented by a hex
    'norcalli/nvim-colorizer.lua',
    eivent = "VeryLazy",
    config = function()
      require("plugins.util.colorizer-nvim")
    end
  },

  { -- Useful plugin to surround text
    "echasnovski/mini.surround",
    config = function()
      require("plugins.util.surround")
    end
  },
}
