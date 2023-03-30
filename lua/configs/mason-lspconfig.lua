local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {""}
	})

end
return M
