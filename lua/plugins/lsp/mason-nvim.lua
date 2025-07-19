local shared = require("plugins.lsp.shared")

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "jdtls",
    "pylsp",
    "clangd",
    "prismals",
    "bashls",
    "cssls",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
      })
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
          },
        },
      })
    end,

    ["pylsp"] = function()
      require("lspconfig").pylsp.setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
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
    end,

    ["clangd"] = function()
      require("lspconfig").clangd.setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "CMakeLists.txt", ".git"),
        settings = {
          clangd = {
            diagnostics = {
              enable = true,
            },
          },
        },
      })
    end,

    ["prismals"] = function()
      require("lspconfig").prismals.setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        cmd = { "prisma-language-server", "--stdio" },
        filetypes = { "prisma" },
        settings = {
          prisma = {
            prismaFmtBinPath = "",
          },
        },
      })
    end,

    ["cssls"] = function()
      require("lspconfig").cssls.setup({
        on_attach = shared.on_attach,
        capabilities = shared.capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        filetypes = { "css", "scss", "less" },
        settings = {
          css = {
            validate = true,
          },
          less = {
            validate = true,
          },
          scss = {
            validate = true,
          },
        },
      })
    end,

    -- ["sqlls"] = function()
    --   require("lspconfig").sqlls.setup({
    --     on_attach = shared.on_attach,
    --     capabilities = shared.capabilities,
    --     cmd = { "sql-language-server", "up", "--method", "stdio" },
    --     filetypes = { "sql" },
    --     root_dir = require("lspconfig").util.root_pattern(".sqllsrc.json", ".git"),
    --     settings = {
    --       sqlLanguageServer = {
    --         connections = {
    --           {
    --             name = "postgres",
    --             adapter = "postgres",
    --             host = "localhost",
    --             port = 5433,
    --             user = "test_user",
    --             password = "test_pass",
    --             database = "test_db",
    --             projectPaths = { "~/Dev/Projects/erm-da-in/" },
    --           },
    --         },
    --         lint = {
    --           rules = {
    --             ["align-column-to-the-first"] = "error",
    --             ["column-new-line"] = "error",
    --             ["linebreak-after-clause-keyword"] = "off",
    --             ["reserved-word-case"] = { "error", "upper" },
    --             ["space-surrounding-operators"] = "error",
    --             ["where-clause-new-line"] = "error",
    --             ["align-where-clause-to-the-first"] = "error",
    --           },
    --         },
    --       },
    --     },
    --   })
    -- end,
  },
})
