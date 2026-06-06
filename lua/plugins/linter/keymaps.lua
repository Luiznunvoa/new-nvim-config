-- INFO: KEYMAPS
--
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Jump to de Definition" })
vim.keymap.set("n", "gk", vim.lsp.buf.hover, { desc = "See Information About Element" })
vim.keymap.set("n", "gl", function()
  vim.diagnostic.open_float(nil, { focusable = false })
end, { desc = "See Diagnostics" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Jump to Implemenation" })
vim.keymap.set({ "v", "n" }, "ga", require("actions-preview").code_actions, { desc = "See Code Actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Code Object" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set(
  "n",
  "<leader>ft",
  function()
    -- FIX: keymap unificado — conform para Python, LSP para os demais.
    -- Anteriormente havia dois <leader>ft: um em core/keymaps.lua (Python/conform)
    -- e este (LSP genérico), sendo que o último sempre vencia por ser carregado depois.
    if vim.bo.filetype == "python" then
      require("conform").format({ async = true })
    else
      vim.lsp.buf.format({ async = true })
    end
  end,
  { desc = "Format current buffer (conform | LSP)" }
)

