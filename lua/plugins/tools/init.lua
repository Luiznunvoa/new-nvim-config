return {
  { -- Utility to run files and projects
    "CRAG666/code_runner.nvim",
    config = function()
      require("plugins.tools.code-runner")
    end
  },
}