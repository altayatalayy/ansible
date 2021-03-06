local vim = vim

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>NERDTreeFocus<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>NERDTreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "do", "<cmd>DiffviewOpen<CR>", opts)
vim.api.nvim_set_keymap("n", "dc", "<cmd>DiffviewClose<CR>", opts)
vim.api.nvim_set_keymap("n", "df", "<cmd>DiffviewFileHistory<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-p>", "<Plug>MarkdownPreviewToggle", opts)
vim.api.nvim_set_keymap("n", "s", "<cmd>HopChar1<CR>", opts)
vim.api.nvim_set_keymap("n", "sw", "<cmd>HopWord<CR>", opts)
