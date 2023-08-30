return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()

			require("plugins.lsp.rust-analyzer").config()
			require("plugins.lsp.lua_ls").config()
			require("plugins.lsp.jdtls").config()
			require("plugins.lsp.html").config()
			require("plugins.lsp.tsserver").config()
			require("plugins.lsp.tailwindcss").config()
			require("plugins.lsp.pyright").config()
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		ft = {"python"},
		opts = function()
			return require("plugins.lsp.null-ls")
		end,
	},

	{
		"williamboman/mason.nvim",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			event = "VeryLazy",
		},
		build = ":MasonUpdate",
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local utils = require("utils")
			local mr = require("mason-registry")
			local packages = utils.mason_packages
			local function ensure_installed()
				for _, package in ipairs(packages) do
					local p = mr.get_package(package)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
}
