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

-- LOAD PLUGIN CONFIGS
require("configs.neoscroll").config()
require("configs.filetype").config()