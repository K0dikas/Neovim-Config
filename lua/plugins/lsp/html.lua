local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities.textDocument.completion.completionItem.snippetSupport = true

function M.config()
    require("lsp_lines").setup{

        require'lspconfig'.html.setup{
            capabilities = capabilities,
            init_options = {
                configurationSection = { "html", "css", "javascript" },
                embeddedLanguages = {
                    css = true,
                    javascript = true
                },
                provideFormatter = true
            },
            filetypes = {"html", "css"},
            cmd = {"html-languageserver", "--stdio"}
        }
    }

end 
return M
