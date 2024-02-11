local M = {}

function M.config()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = on_attach

    require("lsp_lines").setup {

        require('lspconfig')['slint_lsp'].setup{
            cmd = {'slint-lsp'},
            filetypes = {"slint"},
            single_file_support = true,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {}
        }
    }

end
return M
