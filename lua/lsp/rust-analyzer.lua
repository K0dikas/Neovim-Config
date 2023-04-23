local M = {}

function M.config()

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local on_attach = on_attach

	require("lsp_lines").setup{

		require('lspconfig')['rust_analyzer'].setup{
			capabilities = capabilities,
			on_attach = on_attach,
			flags = lsp_flags,
			settings = {
				["rust-analyzer"] = {}
			}
		}
	}

	require('rust-tools').setup()

end
return M
