-- BASICS
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')
vim.opt.number			= true
vim.opt.relativenumber	= true
vim.opt.termguicolors	= true
vim.opt.cursorline      = true
vim.opt.autowrite       = true
vim.opt.showmode		= false
vim.opt.cmdheight		= 0
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = true, 
})

if (vim.fn.has('termguicolors') == 1) then
	vim.opt.termguicolors = true
end

-- TABS

vim.opt.autoindent      = true
vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4
vim.opt.softtabstop     = 4



-- KEYMAPS
require("core.keymaps")

-- PLUGINS
require("core.plugins")

-- THEME
require("core.theme")


-- LOAD PLUGIN CONFIGS
require("impatient")

require("configs.autocomplete").config()
require("configs.statusline").config()
require("configs.treesitter").config()
require("configs.bufferline").config()
