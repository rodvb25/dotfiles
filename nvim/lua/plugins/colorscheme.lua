return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- config = function()
		-- 	vim.cmd([[colorscheme catppuccin-mocha]])
		-- end,
	},
}
