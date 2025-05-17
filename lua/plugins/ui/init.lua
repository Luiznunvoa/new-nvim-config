return {
  { -- Theme
    'Luiznunvoa/gruvbox.nvim',
    lazy = false,
    config = function()
      require("plugins.ui.gruvbox")
    end,
  },

  { -- Home Page
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.ui.alpha")
    end,
  },

  { -- Status Bar
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("plugins.ui.lualine")
    end,
  },

  { -- Indentation lines
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {},
  },

  { -- File tabs
    "romgrk/barbar.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugins.ui.barbar")
    end,
  },

  { -- Comment Highlight
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.ui.todo-comments")
  },
}
