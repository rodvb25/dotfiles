return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = "williamboman/mason-lspconfig.nvim",
	keys = { { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" } },
	opts = {
		automatic_installation = true,
		ui = {
			height = 0.8,
		},
	},
}
