return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-t>]],
			direction = "float",
			float_opts = {
				border = "rounded",
			},
		})
	end,
}
