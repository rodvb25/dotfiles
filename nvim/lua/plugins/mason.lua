return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = "williamboman/mason-lspconfig.nvim",
	keys = { { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" } },
	opts = {
    ensure_installed = {
      "html-lsp",
      "css-lsp",
      "typescript-language-server",
      "lua-language-server",
      "eslint_d",
      "luacheck",
      "prettier",
      "stylua"
    },
		ui = {
			height = 0.8,
		},
	},
}
