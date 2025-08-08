local lazy    = require("lazy")

-- Setting up the plugins
local ui      = require("plugins.ui")
local coding  = require("plugins.coding")
local finder  = require("plugins.finder")
local tools   = require("plugins.tools")
local git     = require("plugins.git")
local lint = require("plugins.lint")

local plugins = {}
vim.list_extend(plugins, ui)
vim.list_extend(plugins, coding)
vim.list_extend(plugins, finder)
vim.list_extend(plugins, tools)
vim.list_extend(plugins, git)
vim.list_extend(plugins, lint)

lazy.setup(plugins)
