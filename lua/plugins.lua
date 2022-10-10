-- Install the plugin manager, the plugins and configure them
 
-- Install packer
local ensure_packer = function()
		local fn = vim.fn
		local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
		if fn.empty(fn.glob(install_path)) > 0 then
				fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
				vim.cmd [[packadd packer.nvim]]
				return true
		end
		return false
end

-- Autocompile packer whenever "plugins.lua" is updated
vim.cmd ([[
		augroup packer_user_config
				autocmd!
				autocmd BufWritePost plugins.lua source <afile> | PackerCompile
		augroup end
]])

-- Use a protected call so there are no errors the first time
local status_ok, packer = pcall(require, "packer")
				if not status_ok then
				return
end

-- Have packer use a popup window
packer.init {
		display = {
				open_fn = function()
						return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install plugins here
return require('packer').startup(function(use)
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- Themes
		use 'folke/tokyonight.nvim'
		
		if packer_bootstrap then
						require('packer').sync()
		end
end)
