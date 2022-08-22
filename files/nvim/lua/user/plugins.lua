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
  use 'lewis6991/impatient.nvim'
  use 'pearofducks/ansible-vim' -- Detect Ansible files
  use 'gpanders/editorconfig.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
  use 'folke/tokyonight.nvim'
  vim.g.tokyonight_style = "night"
  vim.cmd[[colorscheme tokyonight]]

	use "lukas-reineke/indent-blankline.nvim"
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function ()
      require('hlargs').setup()
    end
  }

	use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
        },
      })
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- LSP
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

  -- Disable virtual_text since it's redundant due to lsp_lines.
  vim.diagnostic.config({
      virtual_text = false,
  })

  use {
      'j-hui/fidget.nvim',
      config = function ()
          require"fidget".setup{}
      end
  }

  use { "williamboman/mason.nvim", config = function()  require('mason').setup() end }
  use { "williamboman/mason-lspconfig.nvim",
      -- config = function()  require('mason-lspconfig').setup({automatic_installation = true}) end
  }
  use {
      -- "williamboman/nvim-lsp-installer",
      "neovim/nvim-lspconfig",
  }

  use 'onsails/lspkind.nvim'

  use 'mfussenegger/nvim-jdtls'
  use 'simrat39/rust-tools.nvim'

	-- Completion
	use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
  use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})

	-- Lua snip
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"


  -- Linting
  use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim'}

	-- Telescope
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	}
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use {'camgraff/telescope-tmux.nvim'}
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
  }

	-- Dap
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'mfussenegger/nvim-dap-python'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'nvim-telescope/telescope-dap.nvim'

	use 'phaazon/hop.nvim'


  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({
        'javascript';
        'typescript';
        'html';
        'css';
      })
    end,
  }
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
  }

	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

	use {
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = { "markdown" },
	}
  vim.g.mkdp_filetypes = { "markdown" }

  use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  --[[ -- Neovim orgmode
  use {
    "nvim-neorg/neorg",
    config = function()
      require('neorg').setup({
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ['core.norg.completion'] = { config = { engine = 'nvim-cmp' }},
        ['core.norg.qol.toc'] = {},
        ['core.presenter'] = {},
      }
    })
    end,
    requires = "nvim-lua/plenary.nvim"
  } ]]

  -- Zen mode
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup { }
    end
  }

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.95,
          options = {
            signcolumn = "no",
          }
        },
        plugins = {
          -- disable some global vim options (vim.o...)
          -- comment the lines to not apply the options
          options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
          },
          twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
          gitsigns = { enabled = false }, -- disables git signs
          tmux = { enabled = false },
        }
      }
    end
  }

  use {'glepnir/dashboard-nvim'}

  use 'folke/which-key.nvim'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
