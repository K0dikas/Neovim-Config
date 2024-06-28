local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities.textDocument.completion.completionItem.snippetSupport = true

function M.config()
    require("lsp_lines").setup{
        require'lspconfig'.cssls.setup{
            capabilities = capabilities,
            cmd = {"vscode-css-language-server", "--stdio"},
            filetypes = {'css', 'scss', 'less'},
            init_options = {provideFormatter = true},
            single_file_support = true,
            settings = {
                css = {validate = true},
                sss = {validate = true},
                less = {validate = true},
            },
        },
    }
end
return M
