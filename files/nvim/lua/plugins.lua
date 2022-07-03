local vim = vim
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocmd that runs PackerSync whenever you save plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	vim.notify('Couldn\'t load packer')
	return
end

packer.init {
	display = {
		open_fn = function ()
			return require('packer.util').float { border = "rounded" }
		end
	}
}

return packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'navarasu/onedark.nvim'
	use "lukas-reineke/indent-blankline.nvim"
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	use 'neovim/nvim-lspconfig'

	-- Completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- Lua snip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}

	-- Dap
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'mfussenegger/nvim-dap-python'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'

	use 'numToStr/Comment.nvim'
	use 'phaazon/hop.nvim'

	use 'preservim/nerdtree'
	use 'ap/vim-css-color'

	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
