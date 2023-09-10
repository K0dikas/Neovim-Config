local M = {}

function M.config()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = on_attach

    require("lsp_lines").setup{
        require'lspconfig'.tsserver.setup{
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {"javascript" ,"typescript", "typescriptreact", "typescript.tsx"},
            cmd = {"typescript-language-server", "--stdio"}
        }
    }
end
return M
