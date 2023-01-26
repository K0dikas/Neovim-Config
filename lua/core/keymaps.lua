local opts = {noremap = true, silent = true}

vim.keymap.set('n', '<C-b>', ':NeoTreeShow<cr>')

-- Move to the next buffer
vim.keymap.set('n', '<C-k>', '<Cmd>BufferNext<cr>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>BufferPrevious<cr>', opts)
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<cr>', opts)

-- Activate Automaton animation
vim.keymap.set('n', '<leader>rain', '<Cmd>CellularAutomaton make_it_rain<cr>', opts) -- Char fall
vim.keymap.set('n', '<leader>fire', '<Cmd>CellularAutomaton game_of_life<cr>', opts) -- Fire

-- Activate duck movement
vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 13) end, {}) -- A pretty fast duck
vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 5) end, {}) -- Quite a mellow cat

-- Activate GPT-3 
vim.keymap.set('n', '<leader>ll', '<Cmd>ChatGPT<cr>', opts)

-- Activate side Panel
vim.keymap.set("n", "<leader>oo", function() require("panel")(" ") end, {})
