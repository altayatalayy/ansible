local vim = vim

-- Use a protected call
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	vim.notify('Couldn\'t load telescope')
	return
end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files <CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g", ":Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>k", ":Telescope keymaps<CR>", opts)

telescope.load_extension('fzf')
