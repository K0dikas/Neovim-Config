return {
	"ellisonleao/gruvbox.nvim",
	event = "VeryLazy",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			undercurl = false,
			underline = false,
			bold = true,
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslinesand errors
			contrast = "hard",  -- can be "hard", "soft" or empty string
			overrides = {},
			vim.cmd("set background=dark")
		})
			vim.cmd("colorscheme gruvbox")
	end,
}
