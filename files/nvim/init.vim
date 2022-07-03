" Enable " ftplugin
filetype plugin indent on

lua require('plugins')
lua require('settings')
lua require('keymaps')
lua require('theme')
lua require('lualine-config')
lua require('indent-blankline')
lua require('lsp-config')
lua require('treesitter')
lua require('cmp-config')
lua require('telescope-config')
lua require('hop-nvim')
lua require('comment-nvim')
lua require('dap-config')
lua require('bufferline-config')

" Folding configurations
autocmd BufReadPost,FileReadPost * normal zR
