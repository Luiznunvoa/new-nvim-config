return {
  { -- Git Change Signs
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = require("plugins.git.gitsigns"),
  },

  { -- Useful plugin to see who is writing this terrible code(usually me)
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    -- Because of the keys part, you will be lazy loading this plugin.
    -- The plugin wil only load once one of the keys is used.
    -- If you want to load the plugin at startup, add something like event = "VeryLazy",
    -- or lazy = false. One of both options will work.
    event = "VeryLazy",
    opts = require("plugins.git.git-blame")
  },
}
