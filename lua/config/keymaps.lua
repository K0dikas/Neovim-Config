local opts = {noremap = true, silent = true}

vim.keymap.set('i', '<C-c>', '<Esc>', opts)
vim.keymap.set('n', '<C-b>', ':Neotree show<cr>', opts)
vim.keymap.set('n', '<C-s>', ':Neotree close<cr>', opts)

-- Move to the next buffer
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<cr>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<cr>', opts)
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<cr>', opts)

-- Activate duck movement
vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 13) end, {}) -- A pretty fast duck
vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 5) end, {}) -- Quite a mellow cat

-- Activate GPT-3 
vim.keymap.set('n', '<leader>ll', '<Cmd>ChatGPT<cr>', opts)
