return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		require("lint").linters.luacheck.args = {
			"--globals = vim",
		}

		lint.linters_by_ft = {
			lua = { "luacheck" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			-- c = { "cpplint" },
			-- cpp = { "cpplint" },
			cmake = { "cmakelint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>it", function()
			lint.try_lint()
		end, { noremap = true, desc = "Trigger linting for current file" })
	end,
}
