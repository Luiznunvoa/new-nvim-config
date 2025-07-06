-- Key mappings
local vimMap = vim.keymap.set
local nvimMap = vim.api.nvim_set_keymap

-- Save and quit
vimMap('n', 'W', ':w<CR>')
vimMap('n', 'Q', ':q<CR>')

-- Nvim Tree
vimMap("n", "L", "<Cmd>NvimTreeOpen<CR>", { noremap = true, silent = true })
vimMap("n", "K", "<Cmd>NvimTreeClose<CR>", { noremap = true, silent = true })

vimMap('v', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })

-- Barbar
vimMap("n", "<Tab>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
vimMap("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vimMap("n", "gG", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
vimMap( "n", "<leader>tb",
  function()
    if vim.o.showtabline == 0 then
      vim.o.showtabline = 2
    else
      vim.o.showtabline = 0
    end
  end,
  { desc = "Toggle Bufferline" }
)

-- LSP 
vimMap("n", "gd", vim.lsp.buf.definition, { desc = "Jump to de Definition" })
vimMap("n", "gk", vim.lsp.buf.hover, { desc = "See Information About Element"})
vimMap("n", "gi", vim.lsp.buf.implementation, { desc = "Jump to Implemenation"})
vimMap({ "v", "n" }, "ga", require("actions-preview").code_actions, { desc = "See Code Actions"})
vimMap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Code Object" })
vimMap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})
vimMap(
  "n",
  "<leader>ft",
  function()
    vim.lsp.buf.format({ async = true })
  end,
  { desc = "Format current buffer" }
)

-- Code Runner
vimMap("n", "<leader>rc","<Cmd>RunCode<CR>", { desc = "Run Code"})
vimMap("n", "<leader>rp","<Cmd>RunCode<CR>", { desc = "Run Project"})

-- Telescope
nvimMap(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files()<CR>",
  { noremap = true, silent = true }
)

nvimMap(
  "n",
  "<leader>fg",
  "<cmd>lua require('telescope.builtin').live_grep()<CR>",
  { noremap = true, silent = true }
)

nvimMap(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope.builtin').buffers()<CR>",
  { noremap = true, silent = true }
)

nvimMap(
  "n",
  "<leader>fw",
  "<cmd>lua require('telescope.builtin').grep_string()<CR>",
  { noremap = true, silent = true }
)

nvimMap(
  "n",
  "<leader>fh",
  "<cmd>lua require('telescope.builtin').help_tags()<CR>",
  { noremap = true, silent = true }
)
