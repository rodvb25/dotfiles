local keymap = vim.keymap.set

-- insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- search
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- files
keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Save current file" })

-- buffers
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })

-- navigation windows
keymap("n", "<leader>j", "<C-W>j", { desc = "Move focus to lower window" })
keymap("n", "<leader>k", "<C-W>k", { desc = "Move focus to upper window" })
keymap("n", "<leader>l", "<C-W>l", { desc = "Move focus to right window" })
keymap("n", "<leader>h", "<C-W>h", { desc = "Move focus to left window" })

-- split windows
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- close window
keymap("n", "<leader>q", "<C-W>c", { desc = "Close current window" })

-- window size
keymap("n", "<leader>pj", "<C-W>-", { desc = "Decrease current window height" })
keymap("n", "<leader>pk", "<C-W>+", { desc = "Increase current window height" })
keymap("n", "<leader>ph", "<C-W><", { desc = "Decrease current window width" })
keymap("n", "<leader>pl", "<C-W>>", { desc = "Increase current window width" })
keymap("n", "<leader>pr", "<C-W>=", { desc = "Make all windows equally high and wide" })

-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })

-- terminal
keymap("t", "<leader>jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- diagnostics
keymap("n", "<leader>e", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })
keymap("n", "<M-j>", "<cmd>cnext<cr>", { desc = "Go to next item in the quickfix list" })
keymap("n", "<M-k>", "<cmd>cprev<cr>", { desc = "Go to previous item in the quickfix list" })

-- lsp
keymap("n", "grd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
keymap("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
