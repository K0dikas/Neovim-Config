return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		require("notify").setup({
			fps = 60,
			stages = "slide",
			render = "default",
		})
	end,
}
