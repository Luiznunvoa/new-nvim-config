require("nvim-treesitter.configs").setup({
  -- Install these language parsers
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "tsx"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },

  modules = {},

  ignore_install = {},

  autotag = {
    enable = true, -- toggle based on your HTML/JSX usage
  },

  -- Incremental selection: hit <CR> to expand/shrink
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },

  -- Treesitter playground for query-testing
  playground = {
    enable = true,
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
  },

  -- Rainbow parentheses for better matching
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-bracket delimiters like html tags
    max_file_lines = nil, -- Disable for files with more than n lines, nil = no limit
  },

  -- Textobjects for easier movement and selection
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Add movements to the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
  },

  -- context-aware commentstring (for TSX, JSX, etc.)
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
