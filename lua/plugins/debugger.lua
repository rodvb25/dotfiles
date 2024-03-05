return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"folke/neodev.nvim",
			opts = {
				library = { plugins = { "nvim-dap-ui" }, types = true },
			},
		},

		{
			"rcarriga/nvim-dap-ui",
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup()

				vim.keymap.set("n", "<leader>du", function()
					dapui.toggle({})
				end, { desc = "Dap UI" })

				dap.listeners.before.attach.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.launch.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated.dapui_config = function()
					dapui.close()
				end
				dap.listeners.before.event_exited.dapui_config = function()
					dapui.close()
				end
			end,
		},
	},
	config = function()
		local keymap = vim.keymap.set
		local dap = require("dap")

		keymap("n", "<F5>", function()
			dap.continue()
		end, { desc = "Continue" })
		keymap("n", "<F1>", function()
			dap.step_into()
		end, { desc = "Step Into" })
		keymap("n", "<F2>", function()
			dap.step_over()
		end, { desc = "Step Over" })
		keymap("n", "<F3>", function()
			dap.step_out()
		end, { desc = "Step Out" })
		keymap("n", "<leader>bk", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })
		keymap("n", "<leader>bc", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Breakpoint Condition" })

		dap.adapters.godot = {
			type = "server",
			host = "127.0.0.1",
			port = "6006",
		}
		dap.configurations.gdscript = {
			type = "godot",
			request = "launch",
			name = "Launch scene",
			project = "${workspaceFolder}",
			launch_scene = true,
		}

		dap.adapters.firefox = {
			type = "executable",
			command = "node",
			args = {
				os.getenv("HOME") .. "~/.local/share/nvim/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js",
			},
		}
		for _, language in ipairs({ "typescript", "javascript" }) do
			dap.configurations[language] = {
				{
					name = "Debug with Firefox",
					type = "firefox",
					request = "launch",
					reAttach = true,
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					firefoxExecutable = "/usr/bin/firefox",
				},
			}
		end

		dap.adapters.gdb = {
			id = "gdb",
			type = "executable",
			command = "gdb",
			args = { "--quiet", "-interpreter=dap" },
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
