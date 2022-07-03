local vim = vim
-- global options
vim.api.nvim_set_option('swapfile', false)
vim.api.nvim_set_option('laststatus', 2)
vim.api.nvim_set_option('ruler', true)
vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('mouse', 'v')
vim.api.nvim_set_option('cursorline', true)
vim.api.nvim_set_option('smarttab', true)
vim.api.nvim_set_option('mouse', 'v')

-- window-local options
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_win_set_option(0, 'foldmethod', 'expr')
vim.api.nvim_win_set_option(0, 'foldexpr', 'nvim_treesitter#foldexpr()')



-- buffer-local options
vim.api.nvim_buf_set_option(0, 'tabstop', 4)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 4)
vim.api.nvim_buf_set_option(0, 'softtabstop', 4)
vim.api.nvim_buf_set_option(0, 'autoindent', true)

vim.opt.termguicolors = true
