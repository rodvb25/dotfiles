return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>zm",
			function()
				require("zen-mode").toggle({
					window = {
						backdrop = 1,
					},
				})
			end,
			desc = "Zen Mode",
		},
	},
}
