return {
	"feline-nvim/feline.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"kyazdani42/nvim-web-devicons",
	},
	event = "BufWinEnter",
	config = function()
		local vi_mode_utils = require("feline.providers.vi_mode")
		local lsp = require('feline.providers.lsp')

		local force_inactive = {
			filetypes = {},
			buftypes = {},
			bufnames = {}
		}

		local components = {
			active = {{}, {}, {}},
			inactive = {{}, {}, {}},
		}

		-- vi mode color configuration
		local vi_mode_colors = {
			['NORMAL'] = "#98971a",
			['COMMAND'] = '#8f3f71',
			['INSERT'] = "#fabd2f",
			['REPLACE'] = 'red',
			['LINES'] = 'violet',
			['VISUAL'] = 'violet',
			['OP'] = 'yellow',
			['BLOCK'] = 'yellow',
			['V-REPLACE'] = 'yellow',
			['ENTER'] = 'yellow',
			['MORE'] = 'yellow',
			['SELECT'] = 'yellow',
			['SHELL'] = 'yellow',
			['TERM'] = 'yellow',
			['NONE'] = 'yellow',
		}

		-- gruvbox theme
		local gruvbox = {
			fg = '#ebdbb2',
			bg = '#282828',
			black = '#1d2021',
			skyblue = '#83a598',
			cyan = '#8e07c',
			green = '#b8bb26',
			oceanblue = '#076678',
			blue = '#458588',
			magenta = '#d3869b',
			orange = '#d65d0e',
			red = '#fb4934',
			violet = '#b16286',
			white = '#ebdbb2',
			yellow = '#fabd2f',
		}

		local buffer_not_empty = function()
			if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
				return true
			end
			return false
		end

		local checkwidth = function()
			local squeeze_width  = vim.fn.winwidth(0) / 2
			if squeeze_width > 40 then
				return true
			end
			return false
		end

		force_inactive.filetypes = {
			'NeoTree',
			'dbui',
			'packer',
			'startify',
			'fugitive',
			'fugitiveblame'
		}

		force_inactive.buftypes = {
			'terminal'
		}

		-- STATUSLINE
		-- LEFT

		-- vi-mode
		components.active[1][1] = {
			provider = ' NV-IDE ',
			hl = function()
				local val = {}

				val.bg = vi_mode_utils.get_mode_color()
				val.fg = 'black'
				val.style = 'bold'

				return val
			end,
			right_sep = ' '
		}

		-- filename
		components.active[1][2] = {
			provider = function()
				return vim.fn.expand("%:F")
			end,
			right_sep = ' ',
			hl = {
				fg = 'yellow',
				bg = 'bg',
				style = 'bold'
			}
		}

		-- LSP
		components.active[1][3] = {
			provider = 'lsp_client_names',
			hl = {
				fg = 'red',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}

		-- diagnosticErrors
		components.active[1][4] = {
			provider = 'diagnostic_errors',
			right_sep = ' ',
			enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
			hl = {
				fg = 'red',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diagnosticWarn
		components.active[1][5] = {
			provider = 'diagnostic_warnings',
			right_sep = ' ',
			enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
			hl = {
				fg = 'yellow',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diagnosticHint
		components.active[1][6] = {
			provider = 'diagnostic_hints',
			right_sep = ' ',
			enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
			hl = {
				fg = 'cyan',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diagnosticInfo
		components.active[1][7] = {
			provider = 'diagnostic_info',
			right_sep = ' ',
			enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
			hl = {
				fg = 'skyblue',
				bg = 'bg',
				style = 'bold'
			}
		}

		-- gitBranch
		components.active[1][8] = {
			provider = 'git_branch',
			right_sep = ' ',
			hl = {
				fg = 'violet',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diffAdd
		components.active[1][9] = {
			provider = 'git_diff_added',
			hl = {
				fg = 'green',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diffModfified
		components.active[1][10] = {
			provider = 'git_diff_changed',
			hl = {
				fg = 'orange',
				bg = 'bg',
				style = 'bold'
			}
		}
		-- diffRemove
		components.active[1][11] = {
			provider = 'git_diff_removed',
			hl = {
				fg = 'red',
				bg = 'bg',
				style = 'bold'
			},
		}

		-- RIGHT

		-- fileIcon
		components.active[3][1] = {
			provider = function()
				local filename = vim.fn.expand('%:t')
				local extension = vim.fn.expand('%:e')
				local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
				if icon == nil then
					icon = ''
				end
				return icon
			end,
			hl = function()
				local val = {}
				local filename = vim.fn.expand('%:t')
				local extension = vim.fn.expand('%:e')
				local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
				if icon ~= nil then
					val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
				else
					val.fg = 'white'
				end
				val.bg = 'bg'
				val.style = 'bold'
				return val
			end,
			right_sep = ' '
		}
		-- fileType
		components.active[3][2] = {
			provider = 'file_type',
			hl = function()
				local val = {}
				local filename = vim.fn.expand('%:t')
				local extension = vim.fn.expand('%:e')
				local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
				if icon ~= nil then
					val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
				else
					val.fg = 'white'
				end
				val.bg = 'bg'
				val.style = 'bold'
				return val
			end,
			right_sep = ' '
		}
		-- fileSize
		components.active[3][3] = {
			provider = 'file_size',
			enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
			hl = {
				fg = 'yellow',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}
		-- fileFormat
		components.active[3][4] = {
			provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
			hl = {
				fg = 'green',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}
		-- fileEncode
		components.active[3][5] = {
			provider = 'file_encoding',
			hl = {
				fg = 'red',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}
		components.active[3][6] = {
			provider = 'position',
			hl = {
				fg = 'magenta',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}
		-- linePercent
		components.active[3][7] = {
			provider = 'line_percentage',
			hl = {
				fg = 'orange',
				bg = 'bg',
				style = 'bold'
			},
			right_sep = ' '
		}
		-- scrollBar
		components.active[3][8] = {
			provider = 'scroll_bar',
			hl = {
				fg = 'yellow',
				bg = 'bg',
			},
		}

		-- INACTIVE

		-- fileType
		components.inactive[1][1] = {
			provider = 'file_type',
			hl = {
				fg = 'black',
				bg = 'cyan',
				style = 'bold'
			},
			left_sep = {
				str = ' ',
				hl = {
					fg = 'NONE',
					bg = 'cyan'
				}
			},
			right_sep = {
				{
					str = ' ',
					hl = {
						fg = 'NONE',
						bg = 'cyan'
					}
				},
				' '
			}
		}

		require('feline').setup({
			theme = gruvbox,
			components = components,
			vi_mode_colors = vi_mode_colors,
		})
	end,
}
