return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "luacheck" },
			javascript = { "eslint_d" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
