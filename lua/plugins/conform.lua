return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- keys = {
	-- 	{
	-- 		"<leader>fm",
	-- 		function()
	-- 			require("conform").format({ async = true, lsp_fallback = true })
	-- 		end,
	-- 		mode = { "n", "v" },
	-- 		desc = "Format buffer",
	-- 	},
	-- },
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
			cpp = { "clang_format" },
			c = { "clang_format" },
			xml = { "xmlformat" },
		},
		format_on_save = {
			async = true,
			lsp_fallback = true,
		},
	},
}
