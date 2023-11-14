return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"antosha417/nvim-lsp-file-operations",
		"folke/neodev.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local keymap = vim.keymap.set
		local opts = { noremap = true }
		local builtin = require("telescope.builtin")
		local servers = {
			"cssls",
			"html",
			"tsserver",
			"jsonls",
			"lua_ls",
			"rust_analyzer",
			"bashls",
			"clangd",
			"cmake",
			"lemminx",
			"tailwindcss",
			"prismals",
		}

		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show lsp references"
			keymap("n", "gr", builtin.lsp_references, opts)

			opts.desc = "Go to declaration"
			keymap("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show lsp definitions"
			keymap("n", "gd", builtin.lsp_definitions, opts)

			opts.desc = "Show lsp implementations"
			keymap("n", "gi", builtin.lsp_implementations, opts)

			opts.desc = "Show lsp type definitions"
			keymap("n", "gt", builtin.lsp_type_definitions, opts)

			opts.desc = "See available code actions"
			keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap("n", "<leader>D", builtin.diagnostics, opts)

			opts.desc = "Show line diagnostics"
			keymap("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic"
			keymap("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart lsp"
			keymap("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
		end

		lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
			severity_sort = true,
			autoformat = true,
			format = {
				formatting_options = nil,
				timeout_ms = nil,
			},
			diagnostic = {
				update_in_insert = false,
				virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
				severity_sort = true,
			},
		})

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					completion = { --neodev config
						callSnippet = "Replace",
					},
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false, --stop luassert question
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- Change diagnostics symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
