local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"lua_ls", "tsserver", "html", "tailwindcss"}
	})

end
return M
