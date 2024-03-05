return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"antosha417/nvim-lsp-file-operations",
		"folke/neodev.nvim",
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
			dependencies = {
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
		},
	},
	config = function()
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

		-- setup capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			cssls = {},
			html = {},
			tsserver = {},
			jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = { --neodev config
							callSnippet = "Replace",
						},
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							library = { vim.env.VIMRUNTIME .. "/lua" },
							checkThirdParty = false, --stop luassert question
						},
						telemetry = {
							enable = false,
						},
						library = {
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
					},
				},
			},
			bashls = {},
			clangd = {},
			cmake = {},
			lemminx = {},
			-- blueprint_ls = {},
			glsl_analyzer = {},
			hls = {},
		}

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

		-- setup mason
		require("mason").setup({
			ui = {
				border = "solid",
				height = 0.7,
			},
		})

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"prettier",
			"stylua",
			"eslint_d",
			"luacheck",
			"cpplint",
			"cmakelint",
			"clang-format",
			"xmlformatter",
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
			auto_update = true,
		})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[server_name].setup(server)
				end,
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
