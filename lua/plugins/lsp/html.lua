local M = {}

function M.config()
	require("lsp_lines").setup{

		require'lspconfig'.html.setup{
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true
				},
				provideFormatter = true
			},
			filetypes = {"html"},
			cmd = {"html-languageserver", "--stdio"}
		}
	}

end 
return M
