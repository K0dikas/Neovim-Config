return {
	"rcarriga/nvim-notify",
	event = "BufWinEnter",
	config = function()
		require("notify").setup({
			fps = 60,
			stages = "slide",
			render = "default",
		})
	end,
}
