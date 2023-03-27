local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"lua_ls", "jdtls", "tsserver", "html", "tailwindcss"}
	})

end
return M
