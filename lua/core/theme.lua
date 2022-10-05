-- THEMES

vim.cmd("set background=dark")
require("gruvbox").setup({

    undercurl = false,
    underline = false,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslinesand errors
    contrast = "",  -- can be "hard", "soft" or empty string
    overrides = {},
})
vim.cmd("colorscheme gruvbox")
