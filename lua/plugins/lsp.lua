return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"mason-org/mason.nvim",
			build = ":MasonUpdate",
			config = function()
				require("mason").setup({
					ui = {
						border = "solid",
						height = 0.7,
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})
			end,
		},
	},
	config = function()
		vim.lsp.inlay_hint.enable(true)
		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "DiagnosticError",
					[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
					[vim.diagnostic.severity.HINT] = "DiagnosticHint",
					[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
				},
			},
		})

		vim.lsp.enable({
			"lua_ls",
			"clangd",
			"mesonlsp",
			"ols",
			"lemminx",
			"bashls",
			"jsonls",
			"html",
			"cssls",
			"blueprint_ls",
			"glsl_analyzer",
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					hint = { enable = true },
					telemetry = { enable = false },
					diagnostics = { globals = { "vim" } },
				},
			},
		})
		vim.lsp.config("ols", {
			init_options = {
				enable_inlay_hints = true,
			},
		})
	end,
}
