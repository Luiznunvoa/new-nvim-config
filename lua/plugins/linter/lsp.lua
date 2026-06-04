local lspconfig = vim.lsp.config
local lspEnable = vim.lsp.enable

-- Lua Language Server Config
lspconfig('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Neovim usa LuaJIT
      },
      diagnostics = {
        globals = { "vim" }, -- Evita avisos sobre 'vim' indefinido
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Adiciona arquivos do runtime do Neovim
        checkThirdParty = false,                           -- Evita prompts desnecessários
      },
      telemetry = {
        enable = false, -- Desabilita envio de dados
      },
    },
  },
})

-- Tailwind CSS Config
lspconfig('tailwindcss', {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "html-eex", "css", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "postcss.config.ts", ".git" },
})

-- TypeScript Config
lspconfig('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})

-- Python Config
lspconfig('pyright', {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
})

-- LaTeX Config
lspconfig('texlab', {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".latexmkrc", ".git" },
})

-- Bash Config
lspconfig('bashls', {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git" },
})

-- ESLint Config
lspconfig('eslint', {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
  root_markers = { ".eslintrc.js", ".eslintrc.json", ".eslintrc.yml", ".eslintrc.yaml", "eslint.config.js", "package.json", ".git" },
})

-- Clangd Config
lspconfig('clangd', {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git" },
})

-- Prisma Config
lspconfig('prismals', {
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  root_markers = { "schema.prisma", ".git" },
})

-- Enable all configured LSP servers
lspEnable('lua_ls')
lspEnable('tailwindcss')
lspEnable('ts_ls')
lspEnable('pyright')
lspEnable('texlab')
lspEnable('bashls')
lspEnable('eslint')
lspEnable('clangd')
lspEnable('prismals')
