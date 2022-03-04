" Enable ftplugin
filetype plugin indent on

:set number
:set relativenumber
:set autoindent
:set mouse=v
:set cursorline

:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

call plug#begin('~/.config/nvim/plugged')

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/preservim/nerdtree.git' " NerdTree
Plug 'https://github.com/ap/vim-css-color.git' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neovim/nvim-lspconfig.git' " LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Highlighting, Folding

" nvim-cmp Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

set completeopt=menu,menuone,noselect

:colorscheme gruvbox

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Auto completion using tab
"inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Lsp config
lua require('lsp-config')
lua require('treesitter')
lua require('nvim-cmp')

" Folding configurations
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
