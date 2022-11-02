vim.g.did_load_filetypes = 1
vim.defer_fn(function()
	pcall(require, "impatient")
end, 0)

require "core"
require "core.init"
