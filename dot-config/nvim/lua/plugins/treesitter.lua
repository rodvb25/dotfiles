return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		autotag = { enable = true },
		auto_install = true,
		ensure_installed = {
			"json",
			"javascript",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"gitignore",
			"c",
			"vimdoc",
			"regex",
			"cpp",
			"odin",
			"xml",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
