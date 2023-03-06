local M = {}

function M.config()
	require("mason-lspconfig").setup({
		ensure_installed = {"lua-language-server"}
	})

end
return M
