return {
  { -- Utility to run files and projects
    "CRAG666/code_runner.nvim",
    config = function()
      require("plugins.tools.code-runner")
    end
  },


  { -- File tree
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.tools.tree")
    end,
  },
}
