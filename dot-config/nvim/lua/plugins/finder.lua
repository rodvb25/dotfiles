return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				border = "solid",
				backdrop = 100,
				preview = { border = "solid" },
			},
		})
		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "Search files" })
		vim.keymap.set("n", "<leader>ss", fzf.grep, { desc = "Search by grep" })
		vim.keymap.set("n", "<leader>sc", fzf.grep_cword, { desc = "Search current string" })
		vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "Search existing buffers" })
		vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "Search help" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "Search keymaps" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "Search diagnostics" })

		vim.keymap.set("n", "<leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search neovim config files" })
	end,
}
