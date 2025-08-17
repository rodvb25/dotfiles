local keymap = vim.keymap.set

-- insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- search
keymap("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- files
keymap("n", "<leader>w", "<cmd>write<cr>", { desc = "Save current file" })

-- buffers

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
keymap("n", "<leader>wj", "<C-W>-", { desc = "Decrease current window height" })
keymap("n", "<leader>wk", "<C-W>+", { desc = "Increase current window height" })
keymap("n", "<leader>wh", "<C-W><", { desc = "Decrease current window width" })
keymap("n", "<leader>wl", "<C-W>>", { desc = "Increase current window width" })
keymap("n", "<leader>wr", "<C-W>=", { desc = "Make all windows equally high and wide" })

-- tabs
keymap("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })

-- terminal
keymap("t", "<leader>jk", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- diagnostics
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })

-- lsp
keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymap("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
keymap("n", "<leader>ds", vim.lsp.buf.document_symbol, { desc = "Document symbols" })
keymap("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
