local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- set up formatting on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

--- null-ls builtins ---

-- formatting sources
local formatting = null_ls.builtins.formatting
-- diagnostics sources
local diagnostics = null_ls.builtins.diagnostics
-- completion sources
local completion = null_ls.builtins.completion
-- code actions sources
local code_actions = null_ls.builtins.code_actions
-- hover sources
local hover = null_ls.builtins.hover

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.eslint_d,
		diagnostics.eslint_d,
		completion.luasnip,
		code_actions.eslint_d,
	},

	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
