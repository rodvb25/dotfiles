return {
	-- tokyonight
	{
		"folke/tokyonight.nvim",
		-- config = function()
		-- 	vim.cmd([[colorscheme tokyonight-night]])
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					mason = true,
					lsp_trouble = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"Mofiqul/adwaita.nvim",
	},
	{
		"sainnhe/everforest",
	},
	{
		"sainnhe/gruvbox-material",
	},
}
