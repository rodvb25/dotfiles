return {
	"saghen/blink.cmp",
	dependencies = {
		{ "windwp/nvim-autopairs", opts = {
			check_ts = true,
		} },
		{ "rafamadriz/friendly-snippets" },
	},
	version = "1.*",
	opts = {
		snippets = { preset = "luasnip" },
		keymap = { preset = "enter" },
		cmdline = {
			keymap = { preset = "inherit" },
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
}
