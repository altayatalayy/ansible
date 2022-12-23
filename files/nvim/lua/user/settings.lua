vim.g.mapleader = " "

local options = {
    termguicolors = true,
    undofile = true, -- Enable persistent undo
    updatetime = 100, -- faster completion (default 4000ms)
    timeoutlen = 150, -- key combination timeout
    swapfile = false,
    backup = false, -- disable backupfile
    laststatus = 2,
    incsearch = true,
    hlsearch = false,
    number = true,
    relativenumber = true,
    numberwidth = 3,
    ruler = true,
    cursorline = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smarttab = true,
    smartindent = true,
    wrap = false,
    scrolloff = 8, -- fix scrool
    sidescrolloff = 8,
    clipboard = 'unnamedplus',
    signcolumn = 'yes',
    foldcolumn = '1', -- fold configurations
    foldenable = true,
    foldlevel = 99,
    foldlevelstart = 99,
    ignorecase = true,
    showtabline = 2,
    splitbelow = true, -- fix splits
    splitright = true,
    lazyredraw = true, -- dont draw while executing a macro
    list = true,
    joinspaces = false, -- fix joining lines, dont insert extra space in between elements
    virtualedit = 'block', -- allow cursor to move any where while in visual block (ctrl-p)
}

-- display these characters are present
vim.cmd([[ set listchars=nbsp:⦸ ]])
vim.cmd([[ set listchars+=tab:▷- ]])
vim.cmd([[ set listchars+=trail:• ]])
vim.cmd([[ set whichwrap=b,h,l,s,<,>,[,],~ ]]) -- cross line boundaries with <BS>/h/l/<Left>/<Right>/<Space>

vim.cmd([[ command! -nargs=* W wa ]]) -- -> :W = :w
vim.cmd([[ command! -nargs=* Q qa ]]) -- -> :Q = :qa


for k, v in pairs(options) do
    vim.opt[k] = v
end

-- fix create a new line with comments
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})
