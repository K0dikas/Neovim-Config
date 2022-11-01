local M = {}

function M.config()

	local cmp = require 'cmp'
	cmp.setup({
		snippet = {
            -- REQUIRED - you must specify a snippet engine
			expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },

		mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

	local luasnip = require("luasnip")
    local cmp = require("cmp")

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

	local saga = require 'lspsaga'

    -- use default config
    saga.init_lsp_saga({
        border_style = "bold",
        saga_winblend = 0,
        move_in_saga = { prev = '<C-p>', next = '<C-n>' },
        diagnostic_header = { " ", " ", " ", "ﴞ " },
        max_preview_lines = 10,
        code_action_icon = "",
        code_action_num_shortcut = true,
        code_action_lightbulb = {
            enable = true,
            enable_in_insert = true,
            cache_code_action = true,
            sign = true,
            update_time = 150,
            sign_priority = 20,
            virtual_text = true,
        },
        -- finder icons
        finder_icons = {
            def = '  ',
            ref = '諭 ',
            link = '  ',
        },
        -- finder do lsp request timeout
        -- if your project big enough or your server very slow
        -- you may need to increase this value
        finder_request_timeout = 1500,
        finder_action_keys = {
            open = "o",
            vsplit = "s",
            split = "i",
            tabe = "t",
            quit = "q",
        },
        code_action_keys = {
            quit = "q",
            exec = "<CR>",
        },
        definition_action_keys = {
            edit = '<C-c>o',
            vsplit = '<C-c>v',
            split = '<C-c>i',
            tabe = '<C-c>t',
            quit = 'q',
        },
        rename_action_quit = "<C-c>",
        rename_in_select = true,
        show_outline = {
            win_position = 'right',
            win_with = '',
            win_width = 30,
            auto_enter = true,
            auto_preview = true,
            virt_text = '┃',
            jump_key = 'o',
            auto_refresh = true,
        },
        custom_kind = {},
        server_filetype_map = {},
    })

    require('rust-tools').setup()

end

return M
