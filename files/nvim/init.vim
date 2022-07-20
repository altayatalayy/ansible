" Enable " ftplugin
filetype plugin indent on

lua require('impatient')
lua require('user.plugins')
lua require('user.settings')
lua require('user.keymaps')
lua require('user.theme')
lua require('user.lualine')
lua require('user.indent-blankline')
lua require('user.lsp')
lua require('user.treesitter')
lua require('user.cmp')
lua require('user.telescope')
lua require('user.hop')
lua require('user.comment')
lua require('user.dap')
lua require('user.bufferline')
lua require('user.trouble')
lua require('user.toggleterm')

" Folding configurations
" autocmd BufReadPost,FileReadPost * normal zR
