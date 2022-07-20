local vim = vim

local options = {
    termguicolors = true,
    undofile = true, -- Enable persistent undo
    updatetime = 300, -- faster completion (default 4000ms)
    swapfile = false,
    backup = false,
    laststatus = 2,
    mouse = 'a',
    hlsearch = false,
    number = true,
    relativenumber = true,
    ruler = true,
    cursorline = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smarttab = true,
    smartindent = true,
    wrap = false,
    scrolloff = 8,
    sidescrolloff = 8,
    -- foldmethod = 'expr',
    -- foldexpr =  'nvim_treesitter#foldexpr()',
    clipboard = 'unnamedplus',
    signcolumn = 'yes',
}

for k,v in pairs(options) do
    vim.opt[k] = v
end
