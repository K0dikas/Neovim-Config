local M = {}

function M.config()
	require("lsp_lines").setup{
		require('lspconfig')['lua_ls'].setup{
			on_attach = on_attach,
			flags = lsp_flags,
			settings = {
				["lua_ls"] = {}
			}
		}
	}

end
return M
