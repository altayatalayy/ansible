local vim = vim

-- Use a protected call
local status_ok, dap = pcall(require, 'dap')
if not status_ok then
	vim.notify('Couldn\'t load dap')
	return
end

local status_ok, dapui = pcall(require, 'dapui')
if not status_ok then
	vim.notify('Couldn\'t load dapui')
	return
end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F3>", ":lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", ":lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ptm", ":lua require('dap-python').test_method()<CR>", opts)

dapui.setup()

require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
require("nvim-dap-virtual-text").setup()
require('telescope').load_extension('dap')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
