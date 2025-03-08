return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			xml = { "xmlformatter" },
		},
                format_on_save = {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                }
	},
}
