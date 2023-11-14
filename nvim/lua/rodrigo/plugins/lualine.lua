return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- extensions = { "lazy", "mason", "nvim-dap-ui", "trouble", "nvim-tree" },
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
