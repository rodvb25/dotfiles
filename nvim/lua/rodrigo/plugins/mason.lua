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
		})
	end,
}
