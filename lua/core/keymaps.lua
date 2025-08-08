vim.keymap.set('n', 'W', ':w<CR>')
vim.keymap.set('n', 'Q', ':q<CR>')
vim.keymap.set("n", "gG", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope.builtin').live_grep()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope.builtin').buffers()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fw",
  "<cmd>lua require('telescope.builtin').grep_string()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>lua require('telescope.builtin').help_tags()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files()<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>rc", "<Cmd>RunCode<CR>", { desc = "Run Code" })
vim.keymap.set("n", "<leader>rp", "<Cmd>RunCode<CR>", { desc = "Run Project" })


