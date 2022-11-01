vim.keymap.set('i', '<C-g>', '<esc>')
vim.keymap.set('n', '<C-b>', ':NeoTreeShow<cr>')
vim.keymap.set('n', '<C-x>',
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)
