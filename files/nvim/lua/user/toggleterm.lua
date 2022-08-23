local vim = vim

-- Use a protected call
local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return
end

toggleterm.setup({
    size=20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size=true,
    direction="float",
    close_on_exit=true,
    shell=vim.o.shell,
    float_opts={
        border="curved",
        winblend=0,
        highlights={
            border="Normal",
            background="Normal",
        },
    },
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal


function _LAZYGIT_TOGGLE()
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

function _PYTHON_TOGGLE()
    local filename = vim.api.nvim_buf_get_name(0)
    local python = Terminal:new({ cmd = "python3 -i " .. filename, hidden = true })
    python:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true})

function _HTOP_TOGGLE()
    local htop = Terminal:new({ cmd = "htop", hidden = true })
    htop:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>lua _HTOP_TOGGLE()<CR>", {noremap = true, silent = true})
