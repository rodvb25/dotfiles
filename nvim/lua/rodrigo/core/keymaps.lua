-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlight
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- file
keymap.set("n", "<leader>w", ":write<cr>") -- save file

-- buffers

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>q", "<C-W>c") -- close current window
keymap.set("n", "<leader>j", "<C-W>j") -- go N windows down
keymap.set("n", "<leader>k", "<C-W>k") -- go N windows up
keymap.set("n", "<leader>l", "<C-W>l") -- go N windows right
keymap.set("n", "<leader>h", "<C-W>h") -- go N windows left

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

---------------------
-- Plugins keymaps
---------------------

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find text
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find current string the cursor is on
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- show active buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- show help tags

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
