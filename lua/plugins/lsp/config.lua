local lspconfig = require("lspconfig")
local util      = lspconfig.util

-- INFO: Lua configuration

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      -- diagnostics = {
      --   globals = { "vim" },
      -- },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

-- INFO: TypeScript/JavaScript configuration(Using typescript-tools)

-- lspconfig.ts_ls.setup({
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--   root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
--   settings = {
--     javascript = {
--       suggest = {
--         autoImports = true,
--       },
--       implicitProjectConfig = {
--         exclude = { "node_modules" },
--       },
--     },
--     typescript = {
--       suggest = {
--         autoImports = true,
--       },
--       implicitProjectConfig = {
--         exclude = { "node_modules" },
--       },
--     },
--   },
-- })

-- INFO: Java configuration

lspconfig.jdtls.setup({
  filetypes = { "java" },
})

-- INFO: Python configuration

lspconfig.pylsp.setup({
  filetypes = { "python" },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "W391" },
          maxLineLength = 200,
        },
      },
    },
  },
})

-- INFO: C/C++ configuration

lspconfig.clangd.setup({
  cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
  settings = {
    clangd = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- INFO: Prisma configuration

lspconfig.prismals.setup({
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  -- root_dir = function(startpath)
  --   return M.search_ancestors(startpath, matcher)
  -- end,
  settings = {
    prisma = {
      prismaFmtBinPath = ""
    }
  }
})

-- INFO: Css configuration

lspconfig.cssls.setup({
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
})

-- INFO: Css configuration

lspconfig.sqlls.setup {
  -- comando de inicialização
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql" },

  -- qual diretório considerar raiz de projeto
  root_dir = util.root_pattern('.sqllsrc.json', '.git'),

  settings = {
    sqlLanguageServer = {
      connections = {
        {
          name = "postgres",
          adapter = "postgres",
          host = "localhost",
          port = 5433,
          user = "test_user",
          password = "test_pass",
          database = "test_db",
          projectPaths = { "~/Dev/Projects/erm-da-in/" },
        },
      },
      lint = {
        rules = {
          ["align-column-to-the-first"] = "error",
          ["column-new-line"] = "error",
          ["linebreak-after-clause-keyword"] = "off",
          ["reserved-word-case"] = { "error", "upper" },
          ["space-surrounding-operators"] = "error",
          ["where-clause-new-line"] = "error",
          ["align-where-clause-to-the-first"] = "error",
        }
      }
    }
  },
}
