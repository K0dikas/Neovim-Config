local M = {}

function M.config()

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local on_attach = on_attach

	require("lsp_lines").setup{

		require('lspconfig')['jdtls'].setup{
			cmd = {'jdtls'},
			filetypes = {"java"},
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["java"] = {}
			}
		}
	}
end
return M
