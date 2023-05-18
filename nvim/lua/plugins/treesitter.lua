return {

	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	event = "BufReadPost",
	keys = {
		{ "<c-space>", desc = "Increment selection" },
		{ "<bs>", desc = "Increment selection", mode = "x" },
	},
	opts = {
		highlight = { enable = true },
		sync_install = true,
		indent = { enable = true },
		autotag = { enable = true },
		auto_install = true,
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"gitignore",
			"rust",
			"c",
			"vimdoc",
			"vala",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = "<nop>",
				node_decremential = "bs",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
