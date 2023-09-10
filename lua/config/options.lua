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
vim.opt.expandtab       = true
vim.opt.smartindent     = true
vim.opt.cindent         = true
vim.opt.tabstop         = 8
vim.opt.shiftwidth      = 4
-- vim.opt.softtabstop     = 4

-- DISABLE SEMANTIC HIGHLIGHTING
local links = {
    ['@lsp.type.namespace'] = '@namespace',
    ['@lsp.type.type'] = '@type',
    ['@lsp.type.class'] = '@type',
    ['@lsp.type.enum'] = '@type',
    ['@lsp.type.interface'] = '@type',
    ['@lsp.type.struct'] = '@structure',
    ['@lsp.type.parameter'] = '@parameter',
    ['@lsp.type.variable'] = '@variable',
    ['@lsp.type.property'] = '@property',
    ['@lsp.type.enumMember'] = '@constant',
    ['@lsp.type.function'] = '@function',
    ['@lsp.type.method'] = '@method',
    ['@lsp.type.macro'] = '@macro',
    ['@lsp.type.decorator'] = '@function',
}
for newgroup, oldgroup in pairs(links) do
    vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end
