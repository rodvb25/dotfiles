return {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	keys = {
		{ "gf", "<cmd>Lspsaga lsp_finder<CR>", noremap = true, silent = true, buffer = bufnr }, -- show definition, references
		{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremap = true, silent = true, buffer = bufnr }, -- got to declaration
		{ "gd", "<cmd>Lspsaga peek_definition<CR>", noremap = true, silent = true, buffer = bufnr }, -- see definition and make edits in window
		{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", noremap = true, silent = true, buffer = bufnr }, -- go to implementation
		{ "<leader>ca", "<cmd>Lspsaga code_action<CR>", noremap = true, silent = true, buffer = bufnr }, -- see available code actions
		{ "<leader>rn", "<cmd>Lspsaga rename<CR>", noremap = true, silent = true, buffer = bufnr }, -- smart rename
		{ "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", noremap = true, silent = true, buffer = bufnr }, -- show  diagnostics for line
		{ "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", noremap = true, silent = true, buffer = bufnr }, -- show diagnostics for cursor
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", noremap = true, silent = true, buffer = bufnr }, -- jump to previous diagnostic in buffer
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", noremap = true, silent = true, buffer = bufnr }, -- jump to next diagnostic in buffer
		{ "K", "<cmd>Lspsaga hover_doc<CR>", noremap = true, silent = true, buffer = bufnr }, -- show documentation for what is under cursor
		{ "<leader>o", "<cmd>LSoutlineToggle<CR>", noremap = true, silent = true, buffer = bufnr }, -- see outline on right hand side
	},
	config = function()
		require("lspsaga").setup({})
	end,
}
