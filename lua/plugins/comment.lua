return {
	"numToStr/Comment.nvim",
	lazy = true,
	keys = {"gcc", "gc"},
	config = function()
		require("Comment").setup{
			ignore = "^$",
		}
	end,
}
