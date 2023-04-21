local M = {}

function M.config()
	require("lsp_lines").setup{

		require('lspconfig')['jdtls'].setup{
			cmd = {'jdtls'},
			filetypes = {"java"},
			on_attach = on_attach,
			flags = lsp_flags,
		}
	}

end
return M
