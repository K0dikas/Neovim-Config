local M = {}

function M.config()

	local luasnip = require("luasnip")
    local cmp = require 'cmp'

	cmp.setup({
		snippet = {
            -- REQUIRED - you must specify a snippet engine
			expand = function(args)
				luasnip.lsp_expand(args.body)
            end,
        },

		mapping = {
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
			['<CR>'] = cmp.mapping.confirm{
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}
        },

		sources = cmp.config.sources({
             { name = 'nvim_lsp' },
        }, { { name = 'buffer' } })

    })

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
	
	local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({

        mapping = {

            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            -- ... Your other mappings ...
        },

        -- ... Your other configuration ...
    })

		require "lsp.rust-analyzer".config()
		require("lsp.lua_ls").config()
		require("lsp.jdtls").config()
		require("lsp.html").config()
		require("lsp.tsserver").config()
		require("lsp.tailwindcss").config()

	local devicons = require('nvim-web-devicons')
    cmp.register_source('devicons', {
        complete = function(_, _, callback)
            local items = {}
            for _, icon in pairs(devicons.get_icons()) do
                table.insert(items, {
                    label = icon.icon .. '  ' .. icon.name,
                    insertText = icon.icon,
                    filterText = icon.name,
                })
            end
            callback({ items = items })
        end,
    })

end
return M
