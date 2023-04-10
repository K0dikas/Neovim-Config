local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
	end

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
--require('impatient').enable_profile()

require "core.init"
require "core.theme"
require "core.plugins"
require "core.keymaps"
