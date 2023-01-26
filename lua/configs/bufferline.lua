local M = {}

function M.config()
	require('bufferline').setup {
		auto_hide = true,
		animation = true,
		closable = true,
		clickable = true,
		hide = {current = false, inactive = false, visible = false},
		icons = true,
		icon_custom_colors = true,
		icon_separator_active = '▎',
		icon_separator_inactive = '▎',
		icon_close_tab = '',
		icon_close_tab_modified = '●',
		icon_pinned = '車',
		insert_at_end = false,
		insert_at_start = false,
		maximum_padding = 1,
		minimum_padding = 1,
		semantic_letters = true,
		letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
		no_name_title = nil,
		options = {
			mode = "buffers", 
			numbers = "none",
			close_command = "bdelete! %d", 
			right_mouse_command = "bdelete! %d", 
			left_mouse_command = "buffer %d", 
			middle_mouse_command = nil, 
			indicator = {
				icon = '▎',
				style = 'icon'
			},
			buffer_close_icon = '',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '|',
			right_trunc_marker = '|',
			name_formatter = function(buf) 
				if buf.name:match('%.md') then
					return vim.fn.fnamemodify(buf.name, ':t:r')
				end
			end,
			max_name_length = 18,
			max_prefix_length = 15, 
			tab_size = 18,
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = false,
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = e == "error" and " "
						or (e == "warning" and " " or "")
					s = s .. sym
				end
				return s
			end,
			custom_filter = function(buf_number, buf_numbers)
				if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
					return true
				end
				if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
					return true
				end
				if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
					return true
				end
				if buf_numbers[1] ~= buf_number then
					return true
				end
			end,
			offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" },
				{ filetype = "SymbolsOutline", text = "Symbols Outline", text_align = "center" } },
			color_icons = true,
			show_buffer_icons = true, 
			show_buffer_close_icons = true,
			show_buffer_default_icon = true, 
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, 
			separator_style = "thin",
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			sort_by = 'id'
		}
	}
end

return M
