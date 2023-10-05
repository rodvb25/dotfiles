return {
	"folke/zen-mode.nvim",
	config = function()
		local zenMode = require("zen-mode")
		vim.keymap.set("n", "<leader>zm", function()
			zenMode.toggle({ window = { backdrop = 1 } })
		end, { noremap = true, silent = true })
	end,
}
