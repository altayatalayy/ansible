local vim = vim

-- Use a protected call
local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "[b", ":BufferLineCycleNext<CR>", opts)
vim.api.nvim_set_keymap("n", "]b", ":BufferLineCyclePrev<CR>", opts)
vim.api.nvim_set_keymap("n", "bd", ":bdelete<CR>", opts)
-- vim.api.nvim_set_keymap("n", "", ":BufferLineMoveNext<CR>", opts)
-- vim.api.nvim_set_keymap("n", "", ":BufferLineMovePrev<CR>", opts)
-- vim.api.nvim_set_keymap("n", "", "", opts)
-- vim.api.nvim_set_keymap("n", "", "", opts)

bufferline.setup()
