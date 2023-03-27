local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"lua_ls"}
	})

end
return M
