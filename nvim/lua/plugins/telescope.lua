return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = "v0.1.*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ mode = "n", "<leader>ff", "<cmd>Telescope find_files<CR>", noremap = true, desc = "Find files" },
		{ mode = "n", "<leader>fs", "<cmd>Telescope live_grep<CR>", noremap = true, desc = "Find text" },
		{ mode = "n", "<leader>fc", "<cmd>Telescope grep_string<CR>", noremap = true, desc = "Find current string" },
		{ mode = "n", "<leader>fb", "<cmd>Telescope buffers<CR>", noremap = true, desc = "Show active buffers" },
		{ mode = "n", "<leader>fn", "<cmd>Telescope help_tags<CR>", noremap = true, desc = "Show help tags" },
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
						["<leader>q"] = actions.close,
					},
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
