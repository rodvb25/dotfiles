return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = "williamboman/mason-lspconfig.nvim",
	keys = { { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" } },
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				height = 0.8,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"tsserver",
				"lua_ls",
				"eslint",
				"jsonls",
				"clangd",
			},
			automatic_installation = true,
		})
	end,
}
