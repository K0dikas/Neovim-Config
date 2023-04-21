local M = {}

function M.config()
	require("lsp_lines").setup{
		require'lspconfig'.tsserver.setup{
			on_attach = on_attach,
			filetypes = {"javascript" ,"typescript", "typescriptreact", "typescript.tsx"},
			cmd = {"typescript-language-server", "--stdio"}
		}
	}
end
return M
