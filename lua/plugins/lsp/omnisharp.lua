local M = {}

function M.config()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = on_attach

    require("lsp_lines").setup {

        require('lspconfig')['omnisharp'].setup{
            cmd = {'omnisharp'},
            filetypes = {"cs"},
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {}
        }
    }

end
return M
