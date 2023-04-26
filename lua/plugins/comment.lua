return {
	"numToStr/Comment.nvim",
	lazy = true,
	keys = {"gc", "gcc"},
	config = function()
		require("Comment").setup{
			ignore = "^$",
		}
	end,
}
