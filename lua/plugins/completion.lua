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
		keymap = { preset = "enter" },
		completion = {
			ghost_text = {
				enabled = true,
				show_with_menu = false,
			},
		},
		cmdline = {
			keymap = {
				["<Tab>"] = { "accept" },
				["<CR>"] = { "accept_and_enter", "fallback" },
			},
			completion = { menu = { auto_show = true } },
		},
	},
}
