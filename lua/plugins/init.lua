local lazy    = require("lazy")

-- Setting up the plugins
local git     = require("plugins.git")
local ui      = require("plugins.ui")
local util    = require("plugins.util")
local lsp     = require("plugins.lsp")

local plugins = {}
vim.list_extend(plugins, git)
vim.list_extend(plugins, ui)
vim.list_extend(plugins, util)
vim.list_extend(plugins, lsp)

lazy.setup(plugins)
