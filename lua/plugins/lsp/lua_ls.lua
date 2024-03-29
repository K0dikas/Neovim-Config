local M = {}

function M.config()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = on_attach

    require("lsp_lines").setup{
        require('lspconfig')['lua_ls'].setup{
            capabilities = capabilities,
            on_attach = on_attach,
            flags = lsp_flags,
            settings = {
                ["lua_ls"] = {}
            }
        }
    }

end
return M
