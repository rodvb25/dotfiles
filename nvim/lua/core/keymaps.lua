-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set -- for conciseness

---------------------
-- General keymaps
---------------------

-- use jk to exit insert mode
keymap("i", "jk", "<ESC>")

-- clear search highlight
keymap("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- file
keymap("n", "<leader>w", ":write<cr>") -- save file

-- buffers

-- window management
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split window
keymap("n", "<leader>q", "<C-W>c") -- close current window
keymap("n", "<leader>j", "<C-W>j") -- go N windows down
keymap("n", "<leader>k", "<C-W>k") -- go N windows up
keymap("n", "<leader>l", "<C-W>l") -- go N windows right
keymap("n", "<leader>h", "<C-W>h") -- go N windows left

-- tabs
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
