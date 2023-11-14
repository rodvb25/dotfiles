return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		vim.keymap.set({ "n", "v" }, "<leader>ms", "<cmd>Mason<cr>", { desc = "Mason" })

		mason.setup({
			ui = {
				border = "solid",
				height = 0.7,
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

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"luacheck",
				"cpplint",
				"cmakelint",
				"clang-format",
				"xmlformatter",
			},
			auto_update = true,
		})
	end,
}
