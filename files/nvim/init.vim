" Enable ftplugin
filetype plugin indent on

" Disable status bar
:set laststatus=0 ruler

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
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'

"diffview
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" nvim-cmp Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Nerdcommenter
Plug 'preservim/nerdcommenter'

" Hop
Plug 'phaazon/hop.nvim'

call plug#end()

set completeopt=menu,menuone,noselect

:colorscheme gruvbox

" nerdtree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" diffview
nnoremap do :DiffviewOpen<CR>
nnoremap dc :DiffviewClose<CR>
nnoremap df :DiffviewFileHistory<CR>

" Markdown
nnoremap <C-p> <Plug>MarkdownPreviewToggle

" Telescope
nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>l :Telescope live_grep<CR>
nnoremap <leader>g :Telescope git_files<CR>

" Hop
nnoremap s <cmd>HopChar1<CR>
nnoremap sw <cmd>HopWord<CR>

" Auto completion using tab
"inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Lsp config
lua require('lsp-config')
lua require('treesitter')
lua require('nvim-cmp')
lua require('indent-blankline')
lua require('telescope-nvim')
lua require('hop-nvim')

" Folding configurations
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
autocmd BufReadPost,FileReadPost * normal zR
