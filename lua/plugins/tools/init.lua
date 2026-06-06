return {
  { -- Utility to run files and projects
    "CRAG666/code_runner.nvim",
    config = function()
      require("plugins.tools.code-runner")
    end
  },
  -- NOTE: nvim-tree removido daqui — declaração canônica em plugins/finder/init.lua.
  -- Ter o plugin em dois lugares fazia o lazy.nvim configurar duas vezes.
}
