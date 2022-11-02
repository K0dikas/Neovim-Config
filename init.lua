_G.__luacache_config = {
	chunks = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_chunks',
	},
	modpaths = {
		enable = true,
		path = vim.fn.stdpath('cache')..'/luacache_modpaths',
	}
}
require('impatient').enable_profile()

vim.g.did_load_filetypes = 1
require "core.init"
require "core.theme"
require "core.plugins"
require "core.keymaps"
