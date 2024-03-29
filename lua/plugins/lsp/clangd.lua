local M = {}
function M.config()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = on_attach

    require("lsp_lines").setup {
        require("lspconfig")['clangd'].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
        }
    }
end
return M
