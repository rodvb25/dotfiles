return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", ":NvimTreeToggle<cr>", silent = true, noremap = true, desc = "Open/close NvimTree" },
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				mappings = {
					custom_only = false,
					list = {
						{ key = "l", action = "edit", action_cb = edit_or_open },
						{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
						{ key = "h", action = "close_node" },
						{ key = "H", action = "collapse_all", action_cb = collapse_all },
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			diagnostics = {
				enable = true,
			},
		})
	end,
}
