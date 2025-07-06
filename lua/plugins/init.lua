local lazy    = require("lazy")

-- Setting up the plugins
local ui      = require("plugins.ui")
local lsp     = require("plugins.lsp")
local util    = require("plugins.util")
local git     = require("plugins.git")

local plugins = {}
vim.list_extend(plugins, ui)
vim.list_extend(plugins, lsp)
vim.list_extend(plugins, util)
vim.list_extend(plugins, git)

lazy.setup(plugins)
