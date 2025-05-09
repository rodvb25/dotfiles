return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
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
	opts = {
		servers = {
			cssls = {},
			html = {},
			jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
			bashls = {},
			clangd = {},
			cmake = {},
			lemminx = {},
			-- blueprint_ls = {},
			glsl_analyzer = {
				settings = {
					filetype = {
						"glsl",
						"vert",
						"tesc",
						"tese",
						"frag",
						"geom",
						"comp",
					},
				},
			},
			ols = {
				init_options = {
					enable_inlay_hints = true,
				},
			},
		},
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local builtin = require("telescope.builtin")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", builtin.lsp_definitions, "Goto definition")
				map("gr", builtin.lsp_references, "Goto references")
				map("gI", builtin.lsp_implementations, "Goto implementations")
				map("<leader>D", builtin.lsp_type_definitions, "Type definition")
				map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
				map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("K", vim.lsp.buf.hover, "Hover documentation")
				map("gD", vim.lsp.buf.declaration, "Goto declaration")
			end,
		})

		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
			severity_sort = true,
			autoformat = true,
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			diagnostic = {
				update_in_insert = true,
				virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
				severity_sort = true,
			},
			vim.lsp.inlay_hint.enable(true),
		})

		-- Change diagnostics symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
