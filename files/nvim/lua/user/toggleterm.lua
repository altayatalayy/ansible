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

local wk_status_ok, wk = pcall(require, "which-key")
if not wk_status_ok then
	return
end

function _G.set_terminal_keymaps()
  wk.register({
    ['<esc>'] = { [[<C-\><C-n>]], ''},
    jk = { [[<C-\><C-n>]], ''},
    ['<C-h>'] = { [[<C-\><C-n><C-W>h]], '' },
    ['<C-j>'] = { [[<C-\><C-n><C-W>j]], '' },
    ['<C-k>'] = { [[<C-\><C-n><C-W>k]], '' },
    ['<C-l>'] = { [[<C-\><C-n><C-W>l]], '' },
    }, { mode = 't', silent = true, noremap = true, buffer = 0 })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal


function _LAZYGIT_TOGGLE()
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end


function _PYTHON_TOGGLE()
    local filename = vim.api.nvim_buf_get_name(0)
    local python = Terminal:new({ cmd = "python3 -i " .. filename, hidden = true })
    python:toggle()
end


function _HTOP_TOGGLE()
    local htop = Terminal:new({ cmd = "htop", hidden = true })
    htop:toggle()
end


-- Mappings.
wk.register({
  ["<leader>T"] = {
    name = '+Terminal',
    l = {":lua _LAZYGIT_TOGGLE()<CR>", 'lazygit'},
    p = {":lua _PYTHON_TOGGLE()<CR>", 'python'},
    h = {":lua _HTOP_TOGGLE()<CR>", 'htop'},
    t = {":ToggleTerm<CR>", 'terminal'},
  }
  }, { mode = 'n', silent = true, noremap = true, })
