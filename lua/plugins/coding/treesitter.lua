-- ============================================================================
-- nvim-treesitter configuration (new API — main branch)
-- Requires: Neovim 0.11+, tree-sitter-cli >= 0.26.1
-- Docs: https://github.com/nvim-treesitter/nvim-treesitter (main branch)
-- ============================================================================

-- Basic setup (uses default install_dir)
require("nvim-treesitter").setup {}

-- Install language parsers (async, no-op if already installed)
require("nvim-treesitter").install {
  "lua",
  "sql",
  "javascript",
  "typescript",
  "python",
  "tsx",
  "go",
  "rust",
  "c",
  "cpp",
  "html",
  "css",
  "json",
  "yaml",
  "markdown",
  "bash",
  "vimdoc",
  "query",
  "dockerfile",
  "gitcommit",
  "prisma",
}

-- Enable treesitter-based highlighting, indentation and folding
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true }),
  callback = function()
    -- Highlighting (pcall to skip filetypes without a parser)
    pcall(vim.treesitter.start)

    -- Indentation (experimental but widely used)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    -- Folding
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldlevel = 99 -- open all folds by default
  end,
})

-- ============================================================================
-- nvim-treesitter-textobjects
-- Docs: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- ============================================================================

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@class.outer"] = "V",
    },
    include_surrounding_whitespace = false,
  },
  move = {
    set_jumps = true,
  },
}

-- Select textobjects
vim.keymap.set({ "x", "o" }, "af", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer function" })

vim.keymap.set({ "x", "o" }, "if", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner function" })

vim.keymap.set({ "x", "o" }, "ac", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Select outer class" })

vim.keymap.set({ "x", "o" }, "ic", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner class" })

-- Move to next/previous textobjects
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })

vim.keymap.set({ "n", "x", "o" }, "]]", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class start" })

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function end" })

vim.keymap.set({ "n", "x", "o" }, "][", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "Next class end" })

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "Previous function start" })

vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "Previous class start" })

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "Previous function end" })

vim.keymap.set({ "n", "x", "o" }, "[]", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "Previous class end" })

-- Swap parameters
vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
end, { desc = "Swap next parameter" })

vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
end, { desc = "Swap previous parameter" })

-- Repeatable movements with ; and ,
local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- ============================================================================
-- nvim-ts-autotag — auto close/rename HTML tags
-- ============================================================================

require("nvim-ts-autotag").setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
  per_filetype = {
    ["html"] = {
      enable_close = false,
    },
  },
}
