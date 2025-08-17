return {
	{
		-- "folke/tokyonight.nvim",
		-- opts = {
		-- 	plugins = {
		-- 		auto = true,
		-- 	},
		-- 	style = "night",
		-- },
		-- config = function()
		-- 	vim.cmd("colorscheme tokyonight-night")
		-- end,
	},
	{
		"sainnhe/everforest",
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.everforest_enable_italic = true
		-- 	vim.g.everforest_background = "hard"
		-- 	vim.cmd("colorscheme everforest")
		-- end,
	},
	{
		"Mofiqul/adwaita.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme adwaita")
		end,
	},
}
