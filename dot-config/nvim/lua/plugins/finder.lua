return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
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

		-- enable the extensions if they are installed
		pcall(require("telescope").load_extension("fzf"))

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "Search by grep" })
		vim.keymap.set("n", "<leader>sc", builtin.grep_string, { desc = "Search current string" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search existing buffers" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search neovim config files" })
	end,
}
