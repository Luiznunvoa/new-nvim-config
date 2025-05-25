local lspconfig = require("lspconfig")

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

-- INFO: TypeScript/JavaScript configuration

lspconfig.ts_ls.setup({
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  settings = {
    javascript = {
      suggest = {
        autoImports = true,
      },
      implicitProjectConfig = {
        exclude = { "node_modules" },
      },
    },
    typescript = {
      suggest = {
        autoImports = true,
      },
      implicitProjectConfig = {
        exclude = { "node_modules" },
      },
    },
  },
})

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
