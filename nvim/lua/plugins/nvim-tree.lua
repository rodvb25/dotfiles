return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	keys = {
		{ "<leader>e", ":NvimTreeToggle<cr>", silent = true, noremap = true, desc = "Open/close NvimTree" },
	},
	config = function()
		local api = require("nvim-tree.api")

		local function on_attach(bufnr)
			local function options(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			api.config.mappings.default_on_attach(bufnr)

			local function edit_or_open()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file
					api.node.open.edit()
					-- Close the tree if file was opened
					api.tree.close()
				end
			end

			-- open as vsplit on current node
			local function vsplit_preview()
				local node = api.tree.get_node_under_cursor()

				if node.nodes ~= nil then
					-- expand or collapse folder
					api.node.open.edit()
				else
					-- open file as vsplit
					api.node.open.vertical()
				end

				-- Finally refocus on tree if it was lost
				api.tree.focus()
			end

			vim.keymap.set("n", "l", edit_or_open, options("Edit Or Open"))
			vim.keymap.set("n", "L", vsplit_preview, options("Vsplit Preview"))
			vim.keymap.set("n", "h", api.tree.close, options("Close"))
			vim.keymap.set("n", "H", api.tree.collapse_all, options("Collapse All"))
		end

		require("nvim-tree").setup({
			view = {
				float = {
					enable = true,
					open_win_config = function()
						local screen_w = vim.opt.columns:get()
						local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
						local window_w = screen_w * 0.5
						local window_h = screen_h * 0.6
						local window_w_int = math.floor(window_w)
						local window_h_int = math.floor(window_h)
						local center_x = (screen_w - window_w) / 2
						local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
						return {
							border = "rounded",
							relative = "editor",
							row = center_y,
							col = center_x,
							width = window_w_int,
							height = window_h_int,
						}
					end,
				},
				width = function()
					return math.floor(vim.opt.columns:get() * 0.5)
				end,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			diagnostics = {
				enable = true,
			},
			on_attach = on_attach,
		})
	end,
}
