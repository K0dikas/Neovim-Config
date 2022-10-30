-- packer.nvim
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- PERFORMANCE
	use 'lewis6991/impatient.nvim'
	use 'dstein64/vim-startuptime'
	use 'nathom/filetype.nvim'

	-- COLORSCHEMES 
	use 'ellisonleao/gruvbox.nvim'

	-- BUFFER
	use {'akinsho/bufferline.nvim', tag = "v2.*",
	requires = {'kyazdani42/nvim-web-devicons'}
	}

	-- FILE EXPLORER
	use {'ms-jpq/chadtree', branch = "chad", requires = 'python3 -m chadtree deps'}

	-- LANGUAGE
	use 'nvim-treesitter/nvim-treesitter'
	use 'simrat39/rust-tools.nvim'
	-- use 'glenir/lspsaga.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
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
    config = function()
        require('Comment').setup()
	end
	}


end)
