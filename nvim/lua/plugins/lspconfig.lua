return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		diagnostic = {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
			severity_sort = true,
		},
		severity_sort = true,
		autoformat = true,
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
		servers = {
			cssls = {},
			html = {},
			jsonls = {},
			tsserver = {},
			lua_ls = {},
			rust_analyzer = {},
			bashls = {},
			clangd = {},
			cmake_language_server = {},
		},
		setup = {
			lua_ls = function()
				require("lua_ls").setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local lsp_defaults = lspconfig.util.default_config

		lsp_defaults.capabilities =
			vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

		lspconfig.cssls.setup({})
		lspconfig.html.setup({})
		lspconfig.jsonls.setup({})
		lspconfig.tsserver.setup({})
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		lspconfig.rust_analyzer.setup({})
		lspconfig.bashls.setup({})
		lspconfig.clangd.setup({
			capabilities = { offsetEncoding = "uft-8" },
		})
		lspconfig.cmake.setup({})
		lspconfig.lemminx.setup({})
		lspconfig.vala_ls.setup({})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
