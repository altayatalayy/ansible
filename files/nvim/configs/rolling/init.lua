-- check if packer folder exists if not return
if not vim.fn.isdirectory(vim.fn.stdpath('data') .. '/pack/packer') then
  return
end

pcall(require, "impatient")

require('user.settings')
require('user.plugins')
require('user.keymaps')
require('user.whichkey')
require('user.treesitter')
require('user.alpha')
require("user.nvim-tree")
require('user.lsp')
require('user.dap')
require('user.cmp')
require('user.ufo')
require('user.comment')
require('user.telescope')
require('user.theme')
require('user.lualine')
require('user.indent-blankline')
require('user.hop')
require('user.bufferline')
require('user.trouble')
require('user.toggleterm')
require('user.gitsigns')
require('user.zen-mode')
require('user.colorizer')
