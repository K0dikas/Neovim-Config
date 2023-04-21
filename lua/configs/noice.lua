local M = {}

function M.config()

	require("noice").setup({
		require("notify").setup({
			fps = 120,
			stages = "slide",
			render = "default",
		}),

		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#FABD2F" }),
		vim.api.nvim_set_hl(0, "NoiceCmdlineIconSearch", { fg = '#FABD2F' }),
		vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = '#FABD2F' }),
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", { fg = '#FABD2F' }),
		cmdline = {
			enabled = true,
			view = "cmdline_popup", 
			opts = {}, 

			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = {}, 
			},
		},

		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},

		popupmenu = {
			enabled = true,
			backend = "nui",
			kind_icons = {},
		},

		commands = {
			history = {
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},

			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},

			errors = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
		},

		notify = {
			enabled = true,
			view = "notify",
		},

		health = {
			checker = true,
		},

		smart_move = {
			enabled = true,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
		},

		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = false,
		},

		throttle = 1000 / 30,
		views = {},
		routes = {},
		status = {},
		format = {},
	})

end
return M
