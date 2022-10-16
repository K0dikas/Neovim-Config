local M = {}

function M.config()

	local cmp = require 'cmp'
	cmp.setup({
		snippet = {
            -- REQUIRED - you must specify a snippet engine
			expand = function(args)
                -- luasnip
                require('luasnip').lsp_expand(args.body)
                -- vsnip
                -- vim.fn["vsnip#anonymous"](args.body)
                -- snippy
                -- require('snippy').expand_snippet(args.body)
                -- ultisnip
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },

		sources = cmp.config.sources({
             { name = 'nvim_lsp' },
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
        }, { { name = 'buffer' } })
    })

    -- You can also set special config for specific filetypes:
    --    cmp.setup.filetype('gitcommit', {
    --        sources = cmp.config.sources({
    --            { name = 'cmp_git' },
    --        }, {
    --            { name = 'buffer' },
    --        })
    --    })

    -- nvim-cmp for commands
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    require("lsp_lines").setup{
	
		require('lspconfig')['rust_analyzer'].setup{

			on_attach = on_attach,
			flags = lsp_flags,
			-- Server-specific settings...
			settings = {
				["rust-analyzer"] = {}
			}
		}
	}

	require("lsp_lines").setup{
	
		require('lspconfig')['jdtls'].setup{
			cmd = {'jdtls'},
			root_dir = function(fname)
				return require'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
			end
		}
	}

    require('rust-tools').setup()

end

return M
