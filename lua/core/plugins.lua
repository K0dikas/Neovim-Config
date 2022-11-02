-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	-- PERFORMANCE
	use 'lewis6991/impatient.nvim'
	use 'dstein64/vim-startuptime'
	use 'nathom/filetype.nvim'

	-- COLORSCHEMES 
	use 'ellisonleao/gruvbox.nvim'

	-- BUFFER
	use {'akinsho/bufferline.nvim', tag = "v3.*",
	requires = 'kyazdani42/nvim-web-devicons'
		
	}

	-- FILE EXPLORER
	use {"nvim-neo-tree/neo-tree.nvim",
		branch = "2.43",
		config = function()
			require("configs.neo-tree").config()
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	}	

	-- LANGUAGE
	use {'nvim-treesitter/nvim-treesitter',
		opt = true,
		run = ':TSUpdate',
		event = "BufRead",
		config = function()
			require("configs.treesitter").config()
		end,
	}

	use 'simrat39/rust-tools.nvim'
	use 'glepnir/lspsaga.nvim'

	use {"hrsh7th/nvim-cmp",
		after = {'LuaSnip'},
		config = function()
			require("configs.autocomplete").config()
		end,
		requires = {
			{
				"hrsh7th/cmp-path",
				after = 'nvim-cmp'
			},

			{
				"L3MON4D3/LuaSnip",
				event = 'InsertEnter'
			},

			{
				"hrsh7th/cmp-cmdline",
				after = 'nvim-cmp'
			},

			{
				"hrsh7th/cmp-buffer",
				after = 'nvim-cmp'
			},

			{
				"hrsh7th/cmp-nvim-lsp",
				after = 'nvim-cmp'
			},

			{
				"L3MON4D3/LuaSnip",
				event = 'InsertEnter'
			},
		}
	}

	use {'neovim/nvim-lspconfig',
		after = "cmp-nvim-lsp",
		config = function()
			require("lspconfig")
		end,
	}

	use 'mfussenegger/nvim-jdtls'

	-- STATUS_LINE
	use 'nvim-lualine/lualine.nvim'
	
	-- SMOOTH_SCROLL
	use 'karb94/neoscroll.nvim'

	-- LSP_LINES
	use{"https://git.sr.ht/~whynothugo/lsp_lines.nvim"}


	-- AUTO_PAIRS
	use 'jiangmiao/auto-pairs'
	
	-- AUTO_COMMENT
	use {
    'numToStr/Comment.nvim',
	opt = true,
	keys = {"gc", "gcc", "gcb"},
    config = function()
        require("Comment").setup{}
	end,
	}


end)
