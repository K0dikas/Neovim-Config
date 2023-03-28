-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	-- PERFORMANCE
	use 'lewis6991/impatient.nvim'
	use 'dstein64/vim-startuptime'

	-- MASON
	use {"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					}
				}
			})
		end,
	}	
	use {"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lspconfig").config()
		end,
	}

	-- GIT SIGNS
	use {'lewis6991/gitsigns.nvim',
		config = function()
			require('configs.gitsigns').config()
		end,
	}

	-- COLORSCHEMES 
	use 'ellisonleao/gruvbox.nvim'

	-- BUFFER
	use {'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require("configs.bufferline").config()
		end,
	}

	-- NOICE
	use ({"folke/noice.nvim",
		config = function()
			require("configs.noice").config()
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		require("notify").setup({
			fps = 120,
			stages = "slide",
			render = "default",
		}),
	})

	-- FILE EXPLORER
	use {"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
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

	use {'neovim/nvim-lspconfig',
		config = function()
			require("lspconfig")
		end,
	}

	use {"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.autocomplete").config()
		end,
		requires = {

			{
				"L3MON4D3/LuaSnip",
				tag = "v<CurrentMajor>.*",
				run = "make install_jsregexp",
				event = 'InsertEnter'
			},

			{
				"hrsh7th/cmp-cmdline",
				after = 'nvim-cmp'
			},
			
			{
				"hrsh7th/cmp-nvim-lsp",
				after = 'nvim-cmp'
			},
		},
		config = function()
			require("configs.autocomplete").config()
		end,
	}

	use 'mfussenegger/nvim-jdtls'

	-- STATUS_LINE
	use 'SmiteshP/nvim-navic'
	use {'feline-nvim/feline.nvim', 
		config = function()
			require("configs.feline").config()
		end,
	}

	-- SMOOTH_SCROLL
	-- use 'karb94/neoscroll.nvim'

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
		require("Comment").setup{
			ignore = "^$",
		}
	end,
	}

	-- USELESS BUT COOL PLUGINS
	
	use {'tamton-aquib/duck.nvim'}

end)
