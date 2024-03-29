return {
    'romgrk/barbar.nvim',
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    event = "BufReadPre",
    config = function()
        require("barbar").setup{
            animation = true,
            auto_hide = true,
            tabpages = true,
            clickable = true,
            focuse_on_close = 'left',
            hide = {extensions = true, inactive = true},
            highlight_alternate = true,
            highlight_inactive_file_icons = true,
            highlight_visible = true,

            icons = {
                buffer_index = false,
                buffer_number = false,
                button = '',
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
                    [vim.diagnostic.severity.WARN] = {enabled = false},
                    [vim.diagnostic.severity.INFO] = {enabled = false},
                    [vim.diagnostic.severity.HINT] = {enabled = true},
                },
                filetype = {
                    custom_colors = false,
                    enabled = true,
                },
                separator = {left = '▎', right = ''},
                modified = {button = '●'},
                pinned = {button = '車', filename = true, separator = {right = ''}},
                alternate = {filetype = {enabled = false}},
                current = {buffer_index = true},
                inactive = {button = '×'},
                visible = {modified = {buffer_number = false}},
            },
            insert_at_end = false,
            insert_at_start = false,
            maximum_padding = 1,
            minimum_padding = 1,
            maximum_length = 30,
            semantic_letters = true,
            sidebar_filetypes = {
                NvimTree = true,
                undotree = {text = 'undotree'},
                ['neo-tree'] = {event = 'BufWipeout'},
                Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
            },
            letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
            no_name_title = nil,
        }
    end
}
