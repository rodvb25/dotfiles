return {
	"nvimdev/guard.nvim",
	opts = {
		fmt_on_save = true,
		lsp_as_default_formatter = false,
	},
	config = function(opts)
		local ft = require("guard.filetype")
		ft("lua"):fmt("stylua")
		ft("javascript,typescript,JSX"):fmt("prettier")
		ft("c,c++"):fmt("clang-format")

		require("guard").setup(opts)
	end,
}
