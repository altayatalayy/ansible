local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Autocmd that runs PackerSync whenever you save plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


packer.init {
	display = {
		open_fn = function ()
			return require('packer.util').float { border = "rounded" }
		end
	}
}

packer.reset()

local setup = function ()
  vim.g.tokyonight_style = "night"
  vim.cmd[[colorscheme tokyonight]]
  vim.notify = require("notify")
  vim.g.mkdp_filetypes = { "markdown" }
end


pcall(setup)

return packer.startup(function(use)
  use {
    'wbthomason/packer.nvim',
    --[[ commit = "", ]]
  }

  use {
    'lewis6991/impatient.nvim',
    --[[ commit = "", ]]
  }

  use {
    'pearofducks/ansible-vim',
    --[[ commit = "" ]]
  } -- Detect Ansible files

  use {
    'gpanders/editorconfig.nvim',
    --[[ commit = "" ]]
  }

  use {
    'rcarriga/nvim-notify',
    --[[ commit = "", ]]
  }

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    --[[ commit = "", ]]
	}

  use {
    'folke/tokyonight.nvim',
    --[[ commit = "", ]]
  }

	use {
    "lukas-reineke/indent-blankline.nvim",
    --[[ commit = "", ]]
  }

	use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    --[[ commit = "", ]]
  }

	use {
    'nvim-treesitter/nvim-treesitter',
    --[[ commit = "", ]]
  }

 use {
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
}

  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function () require('hlargs').setup() end,
    --[[ commit = "", ]]
  }

	use {
    'numToStr/Comment.nvim',
    --[[ commit = "", ]]
  }

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    --[[ commit = "", ]]
  }

  use {
    'lewis6991/gitsigns.nvim',
    --[[ commit = "", ]]
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    --[[ commit = "", ]]
  }

  use {
      'j-hui/fidget.nvim',
      config = function () require"fidget".setup{} end,
    --[[ commit = "", ]]
  }

  use {
    "williamboman/mason.nvim",
    config = function()  require('mason').setup() end,
    --[[ commit = "", ]]
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    --[[ commit = "", ]]
  }

  use {
    "neovim/nvim-lspconfig",
    --[[ commit = "", ]]
  }

  use {
    "RRethy/vim-illuminate",
    --[[ commit = "", ]]
  }

  use {
    'onsails/lspkind.nvim',
    --[[ commit = "", ]]
  }

  use {
    'mfussenegger/nvim-jdtls',
    --[[ commit = "", ]]
  }

  use {
    'simrat39/rust-tools.nvim',
    --[[ commit = "", ]]
  }

	-- Completion
  use {
    'hrsh7th/cmp-nvim-lsp',
    --[[ commit = "", ]]
  }
  use {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    --[[ commit = "", ]]
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    --[[ commit = "", ]]
  }

  use {
    'hrsh7th/cmp-buffer',
    --[[ commit = "", ]]
  }

  use {
    'hrsh7th/cmp-path',
    --[[ commit = "", ]]
  }

  use {
    'hrsh7th/cmp-cmdline',
    --[[ commit = "", ]]
  }

  use {
    'hrsh7th/nvim-cmp',
    --[[ commit = "", ]]
  }

  use {
    "petertriho/cmp-git",
    requires = "nvim-lua/plenary.nvim",
    --[[ commit = "", ]]
  }

	-- Lua snip
	use {
    'L3MON4D3/LuaSnip',
    --[[ commit = "", ]]
  }

	use {
    'saadparwaiz1/cmp_luasnip',
    --[[ commit = "", ]]
  }

  use {
    "rafamadriz/friendly-snippets",
    --[[ commit = "", ]]
  }

  -- Linting
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    --[[ commit = "", ]]
  }

	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} },
    --[[ commit = "", ]]
	}

	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    --[[ commit = "", ]]
	}

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    --[[ commit = "", ]]
  }

  use {
    'nvim-telescope/telescope-ui-select.nvim',
    --[[ commit = "", ]]
  }

  use {
    'camgraff/telescope-tmux.nvim',
    --[[ commit = "", ]]
  }

  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function() require('neoclip').setup() end,
    --[[ commit = "", ]]
  }

  use {
    'nvim-telescope/telescope-media-files.nvim',
    --[[ commit = "", ]]
  }

	-- Dap
	use {
    'mfussenegger/nvim-dap',
    --[[ commit = "", ]]
  }

	use {
    'rcarriga/nvim-dap-ui',
    --[[ commit = "", ]]
  }

	use {
    'mfussenegger/nvim-dap-python',
    --[[ commit = "", ]]
  }

	use {
    'theHamsta/nvim-dap-virtual-text',
    --[[ commit = "", ]]
  }

	use {
    'nvim-telescope/telescope-dap.nvim',
    --[[ commit = "", ]]
  }

	use {
    'phaazon/hop.nvim',
    --[[ commit = "", ]]
  }


  use {
    'norcalli/nvim-colorizer.lua',
    --[[ commit = "", ]]
  }

  --[[ use { ]]
  --[[   "nvim-neo-tree/neo-tree.nvim", ]]
  --[[   branch = "v2.x", ]]
  --[[   requires = { ]]
  --[[     "nvim-lua/plenary.nvim", ]]
  --[[     "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended ]]
  --[[     "MunifTanjim/nui.nvim", ]]
  --[[   }, ]]
  --[[   commit = "", ]]
  --[[ } ]]

	use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    --[[ commit = "", ]]
  }

	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = { "markdown" },
    --[[ commit = "", ]]
	}

  use {
    "ellisonleao/glow.nvim",
    config = function ()
      require('glow').setup({
        width = 120,
      })
    end,
    --[[ commit = "", ]]
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*',
    --[[ commit = "", ]]
  }
  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    --[[ commit = "", ]]
  }

  -- Zen mode
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup { }
    end,
    --[[ commit = "", ]]
  }

  use {
    "folke/zen-mode.nvim",
    --[[ commit = "", ]]
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
    end
  }

  use {
    'folke/which-key.nvim',
    --[[ commit = "", ]]
  }

  use {
    'tpope/vim-surround'
    --[[ commit = "", ]]
  }

end)
