local M = {}

function M.setup(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Ir para definição
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  -- Mostrar informações hover
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  -- Ir para implementação
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  -- Lista de referências
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- Renomear símbolo
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- Ações de código
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Diagnósticos
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

return M
