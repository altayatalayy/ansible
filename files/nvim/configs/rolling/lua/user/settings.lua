vim.g.mapleader = " "

local options = {
  termguicolors = true,
  undofile = true, -- Enable persistent undo
  updatetime = 150, -- faster completion (default 4000ms)
  timeoutlen = 150,
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
  foldcolumn = '1',
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  ignorecase = true,
  showtabline = 2,
  splitbelow = true,
  splitright = true,
}


for k,v in pairs(options) do
    vim.opt[k] = v
end

-- fix create a new line with comments
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.opt.formatoptions:remove({'c', 'r', 'o'})
  end,
})
