local vim = vim

-- Use a protected call
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
	vim.notify('Couldn\'t load telescope')
	return
end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser <CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>l", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>k", ":Telescope keymaps<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>nc", ":Telescope neoclip<CR>", opts)

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end


wk.register({
  ["<leader>"] = {
    t = {
      name = '+Telescope',
      ff = {':Telescope find_files <CR>', 'Telescope find files'},
      fb = {':Telescope file_browser <CR>', 'Telescope file browser'},
      g = {':Telescope git_files <CR>', 'Telescope git files'},
      l = {':Telescope live_grep <CR>', 'Telescope live grep'},
      k = {':Telescope keymaps <CR>', 'Telescope keymaps'},
      b = {':Telescope buffers <CR>', 'Telescope buffers'},
      c = {':Telescope neoclip <CR>', 'Telescope neoclip'},
    } 
  }}, { mode = 'n'}
)

telescope.load_extension('fzf')
telescope.load_extension('file_browser')
telescope.load_extension('tmux')
telescope.load_extension('neoclip')
