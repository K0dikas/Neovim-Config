return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	},
	config = function()
		local cmp = require('cmp')
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = vim.F.unpack_len(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		local lspkind = require('lspkind')
		local luasnip = require("luasnip")

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
				},


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

			},

			sources = cmp.config.sources({
				{ name = 'nvim_lsp'},
				}, { { name = 'buffer' } }),

			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
				})
			},
			vim.api.nvim_set_hl(0, "TextColor", {fg = "#fb4934"}),
			vim.api.nvim_set_hl(0, "TextColor_Selection", {bg = "#3c3836", fg = "#b8bb26"}),
			vim.api.nvim_set_hl(0, "BorderColor", {fg = "#fabd2f"}),
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderColor,CursorLine:TextColor_Selection,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:Normal,FloatBorder:BorderColor,CursorLine:CursorLine,Search:None",
				}),
			},
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
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
