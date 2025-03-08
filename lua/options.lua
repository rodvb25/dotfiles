-- :help options

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.expandtab = true
vim.opt.smartindent = true

-- cursor line
vim.opt.cursorline = true

-- mouse options
vim.opt.mouse = "a"

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false

-- line wrapping
vim.opt.wrap = false

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- file encoding
vim.opt.fileencoding = "utf-8"

-- scroll
vim.opt.scrolloff = 4

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Undo history
vim.opt.undofile = true

-- preview substitution live
vim.opt.inccommand = "split"

-- completion
vim.opt.completeopt = "menu,menuone,preview,noselect,noinsert"

-- colorscheme
vim.api.nvim_set_hl(0, "VertSplit", { link = "NormalFloat" })
