-- :help options

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = true

-- mouse options
vim.opt.mouse = "a"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.background = "dark"

-- line wrapping
vim.opt.wrap = false

-- search
vim.opt.hlsearch = true

-- file encoding
vim.opt.fileencoding = "utf-8"

-- autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- scroll
vim.opt.scrolloff = 8

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

--nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
