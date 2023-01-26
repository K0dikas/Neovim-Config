local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"sumneko_lua"}
	})

end
return M
