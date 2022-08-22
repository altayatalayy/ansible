local vim = vim

local options = {
    termguicolors = true,
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- faster completion (default 4000ms)
    timeoutlen = 500,
    swapfile = false,
    backup = false,
    laststatus = 2,
    mouse = 'a',
    incsearch = true,
    hlsearch = false,
    number = true,
    relativenumber = true,
    ruler = true,
    cursorline = true,
    tabstop = 2,
    shiftwidth = 2,
    numberwidth = 4,
    expandtab = true,
    smarttab = true,
    smartindent = true,
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    clipboard = 'unnamedplus',
    signcolumn = 'yes',
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    ignorecase = true,
    showtabline = 2,
    splitbelow = true,
    splitright = true,
}

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tk', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tj', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

for k,v in pairs(options) do
    vim.opt[k] = v
end
