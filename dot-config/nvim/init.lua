-- options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.wrap = false
vim.opt.textwidth = 100
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.fileencoding = "utf-8"
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.confirm = true
vim.opt.cmdheight = 0
vim.opt.guicursor =
	"a:blinkon500-blinkoff300,n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:block,t:hor20-blinkon500-blinkoff500-TermCursor"
require("vim._core.ui2").enable()

-- keymaps
local keymap = vim.keymap.set
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Save current file" })
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })
keymap("n", "<leader>j", "<C-W>j", { desc = "Move focus to lower window" })
keymap("n", "<leader>k", "<C-W>k", { desc = "Move focus to upper window" })
keymap("n", "<leader>l", "<C-W>l", { desc = "Move focus to right window" })
keymap("n", "<leader>h", "<C-W>h", { desc = "Move focus to left window" })
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>q", "<C-W>c", { desc = "Close current window" })
keymap("n", "<leader>pj", "<C-W>-", { desc = "Decrease current window height" })
keymap("n", "<leader>pk", "<C-W>+", { desc = "Increase current window height" })
keymap("n", "<leader>ph", "<C-W><", { desc = "Decrease current window width" })
keymap("n", "<leader>pl", "<C-W>>", { desc = "Increase current window width" })
keymap("n", "<leader>pr", "<C-W>=", { desc = "Make all windows equally high and wide" })
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap("t", "<leader>jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<leader>e", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
keymap("n", "<M-j>", "<cmd>cnext<cr>", { desc = "Go to next item in the quickfix list" })
keymap("n", "<M-k>", "<cmd>cprev<cr>", { desc = "Go to previous item in the quickfix list" })
keymap("n", "grd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
keymap("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
keymap("n", "<leader>u", vim.pack.update, { desc = "Update all packages" })

keymap("n", "<leader>tp", function()
	print(#vim.pack.get(nil, { info = false }))
end, { desc = "Number of plugins installed" })

keymap("n", "<leader>ap", function()
	print(#vim.iter(vim.pack.get(nil, { info = false }))
		:filter(function(x)
			return x.active
		end)
		:totable())
end, { desc = "Number of active plugins" })

-- plugins
vim.pack.add({
	"gh:Mofiqul/adwaita.nvim",
	"gh:nvim-tree/nvim-web-devicons",
	"gh:rafamadriz/friendly-snippets",
	"gh:windwp/nvim-autopairs",
	{ src = "gh:saghen/blink.cmp", version = vim.version.range("1.*") },
	"gh:ibhagwan/fzf-lua",
	"gh:stevearc/conform.nvim",
	"gh:nvim-lualine/lualine.nvim",
	"gh:mfussenegger/nvim-lint",
	"gh:mason-org/mason.nvim",
	"gh:neovim/nvim-lspconfig",
	"gh:windwp/nvim-ts-autotag",
	"gh:nvim-treesitter/nvim-treesitter",
	"gh:folke/trouble.nvim",
})

vim.cmd("colorscheme adwaita")

require("nvim-autopairs").setup({ check_ts = true })
require("blink.cmp").setup({
	keymap = { preset = "enter" },
	signature = { enabled = true },
	completion = { menu = { draw = { treesitter = { "lsp" } } } },
	cmdline = {
		keymap = {
			["<Tab>"] = { "accept" },
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
		completion = { menu = { auto_show = true } },
	},
})

local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		border = "solid",
		backdrop = 100,
		preview = { border = "solid" },
	},
})
keymap("n", "<leader>sf", fzf.files, { desc = "Search files" })
keymap("n", "<leader>ss", fzf.grep, { desc = "Search by grep" })
keymap("n", "<leader>sc", fzf.grep_cword, { desc = "Search current string" })
keymap("n", "<leader>sb", fzf.buffers, { desc = "Search existing buffers" })
keymap("n", "<leader>sh", fzf.helptags, { desc = "Search help" })
keymap("n", "<leader>sk", fzf.keymaps, { desc = "Search keymaps" })
keymap("n", "<leader>sd", fzf.diagnostics_document, { desc = "Search diagnostics" })
keymap("n", "<leader>sm", fzf.manpages, { desc = "Search manpages" })
keymap("n", "<leader>sn", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search neovim config files" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
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
	},
})

local lint = require("lint")
lint.linters.luacheck.args = {
	"--globals = vim",
}

lint.linters_by_ft = {
	lua = { "luacheck" },
	javascript = { "eslint_d" },
	c = { "cpplint" },
	cpp = { "cpplint" },
	cmake = { "cmakelint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

keymap("n", "<leader>it", function()
	lint.try_lint()
end, { noremap = true, desc = "Trigger linting for current file" })

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

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				workspace = {
					library = { vim.env.VIMRUNTIME },
				},
			},
		},
	},
	clangd = {},
	mesonlsp = {},
	ols = {},
	lemminx = {},
	bashls = {},
	jsonls = {},
	html = {},
	cssls = {},
	blueprint_ls = {},
	glsl_analyzer = {},
	slangd = {},
	zls = {},
}

vim.lsp.document_color.enable(true, {}, { style = "virtual" })
vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	virtual_text = { source = "if_many" },
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

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end

require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
	autotag = { enable = true },
	auto_install = true,
	ensure_installed = {
		"json",
		"javascript",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"gitignore",
		"c",
		"vimdoc",
		"regex",
		"cpp",
		"odin",
		"xml",
	},
})

require("lualine").setup({
	extensions = { "mason", "trouble" },
})

require("trouble").setup()
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
