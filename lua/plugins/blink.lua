return {
	"saghen/blink.cmp",
	dependencies = {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
	},
	version = "*",
	opts = {
		snippets = { preset = "luasnip" },
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
}
