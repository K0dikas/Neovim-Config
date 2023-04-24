local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"tsserver", "html", "tailwindcss"}
	})

end
return M
