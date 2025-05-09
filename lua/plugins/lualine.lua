return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	enabled = false,
	opts = {
		extensions = { "lazy", "mason", "trouble" },
		sections = { -- show the number of pending updates in lazy
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
			},
		},
	},
}
