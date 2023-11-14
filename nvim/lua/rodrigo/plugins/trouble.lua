return {
	"folke/trouble.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("trouble").setup({
			mode = "document_diagnostics",
		})

		local keymap = vim.keymap.set
		local opts = { silent = true, noremap = true }
		opts.desc = "Toggle Trouble"
		keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

		opts.desc = "Trouble workspace diagnostics"
		keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)

		opts.desc = "Trouble document_diagnostics"
		keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

		opts.desc = "Trouble loclist"
		keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)

		opts.desc = "Trouble quickfix"
		keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)

		opts.desc = "Trouble LSP references"
		keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
	end,
}
