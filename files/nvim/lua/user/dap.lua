local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, 'dapui')
if not dapui_status_ok then
	return
end

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

-- Register Dap keymaps
wk.register({
  ["<leader>d"] = {
    name = '+DAP',
    b = {":lua require'dap'.toggle_breakpoint()<CR>", 'toggle_breakpoint'},
    B = {":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", 'Condtional Break Point'},
    l = {":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", 'log msg'},
    r = {":lua require'dap'.repl.open()<CR>", 'REPL'},
    c = {":lua require'dap'.continue()<CR>", 'continue'},
    o = {":lua require'dap'.step_over()<CR>", 'step_over'},
    i = {":lua require'dap'.step_into()<CR>", 'step_into'},
    u = {":lua require'dap'.step_out()<CR>", 'step_out'},
  }
  }, { mode = 'n', silent = true, noremap = true, })



dapui.setup()

require('dap-python').setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
