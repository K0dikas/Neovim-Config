-- _G.__luacache_config = {
-- 	chunks = {
-- 		enable = true,
-- 		path = vim.fn.stdpath('cache')..'/luacache_chunks',
-- 	},
-- 	modpaths = {
-- 		enable = true,
-- 		path = vim.fn.stdpath('cache')..'/luacache_modpaths',
-- 	}
-- }
-- require('impatient').enable_profile()

require "core.init"
require "core.plugins"
require "core.theme"
require "core.keymaps"
