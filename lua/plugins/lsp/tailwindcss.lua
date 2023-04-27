local M = {}

function M.config()
	require("lsp_lines").setup{
		require'lspconfig'.tailwindcss.setup{
		}
	}
end
return M
