return {
	"windwp/nvim-autopairs",
	lazy = false,
	dependencies = {
		"cmp",
		"nvim-autopairs.completion.cmp",
	},
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true,
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()),
		})
	end,
}
