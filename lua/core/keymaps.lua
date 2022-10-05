vim.keymap.set('i', '<C-g>', '<esc>')
vim.keymap.set('n', '<C-b>', ':CHADopen<cr>')
vim.keymap.set('n', '<C-S', ':tabm<cr>')
vim.keymap.set('n', '<C-x>',
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)






