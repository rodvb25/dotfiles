-- set leader key to space
vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap.set

-- insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- search
keymap("n", "<leader>nh", "<cmd>nohl<cr>", { desc = "Clear search highlight" })

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- files
keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Save current file" })

-- buffers

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make split window equal width" })
keymap("n", "<leader>sx", "<cmd>close<cr>", { desc = "Close current split window" })
keymap("n", "<leader>q", "<C-W>c", { desc = "Close current window" })
keymap("n", "<leader>j", "<C-W>j", { desc = "Go N windows down" })
keymap("n", "<leader>k", "<C-W>k", { desc = "Go N windows up" })
keymap("n", "<leader>l", "<C-W>l", { desc = "Go N windows right" })
keymap("n", "<leader>h", "<C-W>h", { desc = "Go N windows left" })

-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
