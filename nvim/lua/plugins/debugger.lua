return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			keys = {
        -- stylua: ignore
				{"<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI"},
			},
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")

				dapui.setup()

				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},

		{
			"jay-babu/mason-nvim-dap.nvim",
			config = function()
				require("mason-nvim-dap").setup({
					automatic_setup = true,
					ensure_installed = {
						"cpptools",
						"js",
						"codelldb",
					},
					handlers = {},
				})
			end,
		},
	},
  --stylua: ignore
	keys = {
		--Basic debugging keymap
		{"<F5>", function() require("dap").continue() end, desc = "Continue"},
		{"<F1>", function() require("dap").step_into() end, desc = "Step Into"},
		{"<F2>", function() require("dap").step_over() end, desc = "Step Over"},
		{"<F3>", function() require("dap").step_out() end, desc = "Step Out"},
		{"<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint"},
		{"<leader>b", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition"},
	},
}
