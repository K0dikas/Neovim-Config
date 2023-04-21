local M = {}

function M.config()

	require("lsp_lines").setup{

		require('lspconfig')['rust_analyzer'].setup{

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
