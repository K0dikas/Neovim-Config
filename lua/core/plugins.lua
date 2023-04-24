-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	-- PERFORMANCE (Comment out if you don't want to use them)
	{'lewis6991/impatient.nvim',
		config = function()
			require("configs.impatient").config()
		end,
	},

	'dstein64/vim-startuptime',

	-- MASON
	{"williamboman/mason.nvim",
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
	},

	-- JAVA-LANGUAGE-SERVER
	'mfussenegger/nvim-jdtls',

	{"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lspconfig").config()
		end,
	},

	-- GIT SIGNS
	{'lewis6991/gitsigns.nvim',
		config = function()
			require('configs.gitsigns').config()
		end,
	},

	-- COLORSCHEMES 
	{'ellisonleao/gruvbox.nvim',
		config = function ()
			require('configs.theme').config()
		end,
	},

	-- BUFFER
	{'romgrk/barbar.nvim',
		dependencies = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require("configs.barbar").config()
		end,
	},

	-- NOICE
	({"folke/noice.nvim",
		config = function()
			require("configs.noice").config()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	}),

	-- FILE EXPLORER
	{"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		config = function()
			require("configs.neo-tree").config()
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		}
	},

	-- LANGUAGE
	{'nvim-treesitter/nvim-treesitter',
		lazy = true,
		build = ':TSUpdate',
		event = "BufRead",
		config = function()
			require("configs.treesitter").config()
		end,
	},

	'simrat39/rust-tools.nvim',

	{'neovim/nvim-lspconfig',
		config = function()
			require("lspconfig")
		end,
	},

	{"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
				"L3MON4D3/LuaSnip",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp",
				"onsails/lspkind.nvim",
		},
		config = function()
			require("configs.autocomplete").config()
		end,
	},

	-- STATUS_LINE
	'SmiteshP/nvim-navic',
	{'feline-nvim/feline.nvim', 
		config = function()
			require("configs.feline").config()
		end,
	},

	-- SMOOTH_SCROLL
	{'karb94/neoscroll.nvim',
		config = function()
			require("configs.neoscroll").config()
		end,
	},

	-- LSP_LINES
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",

	-- AUTO_PAIRS
	'jiangmiao/auto-pairs',
	
	-- AUTO_COMMENT
	{'numToStr/Comment.nvim',
	lazy = true,
	keys = {"gc", "gcc", "gcb"},
	config = function()
		require("Comment").setup{
			ignore = "^$",
		}
	end,
	},

	-- USELESS BUT COOL PLUGINS
	'tamton-aquib/duck.nvim',
}

local opts = {}

require('lazy').setup(plugins, opts)
