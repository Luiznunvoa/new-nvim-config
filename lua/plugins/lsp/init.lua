return {
  { -- Setup of the Mason plugin to manage the language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  { -- Bridge of Mason with lspconfig
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("plugins.lsp.mason-nvim")
    end,
  },

  { -- Neodev to enhances Lua LSP with Neovim API definitions
    "folke/neodev.nvim",
    lazy = false,
    opts = {},
  },

  {
    -- LSP config (mantido para outros servidores)
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("lspconfig")
      require("plugins.lsp.shared")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")


      lint.linters.sqlfluff = {
        cmd = "sqlfluff",
        stdin = false,
        args = {
          "lint",
          "--format", "json",
          "--dialect", "postgres",
        },
        stream = "stdout",
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local ok, decoded = pcall(vim.json.decode, output)
          if not ok or type(decoded) ~= "table" then
            return {}
          end

          local diagnostics = {}
          for _, file in ipairs(decoded) do
            for _, v in ipairs(file.violations or {}) do
              table.insert(diagnostics, {
                lnum = v.start_line_no - 1,
                col = v.start_line_pos - 1,
                end_lnum = v.end_line_no - 1,
                end_col = v.end_line_pos - 1,
                source = "sqlfluff",
                message = v.description or "sqlfluff violation",
                severity = v.warning and vim.diagnostic.severity.WARN or vim.diagnostic.severity.ERROR,
              })
            end
          end
          return diagnostics
        end
      }

      lint.linters_by_ft = {
        sql = { "sqlfluff" },
        ["jinja.sql"] = { "sqlfluff" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave"}, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  { -- Autocompletion framework
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    event = "VeryLazy",
    config = function()
      require("plugins.lsp.nvim-cmp")
    end,
  },

  { -- Syntax Highlighting and a lot more
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    run = ":TSUpdate",
    config = function()
      require("plugins.lsp.treesitter")
    end,
  },

  { -- Useful plugin for analyzing errors
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = require("plugins.lsp.trouble")
  },

  { -- Create a float window with a preview of code actions
    "aznhe21/actions-preview.nvim",
  },

  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("plugins.lsp.tsls-tools")
    end
  },
}
