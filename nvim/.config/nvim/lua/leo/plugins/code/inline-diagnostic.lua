return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			show_source = {
				enabled = true,
				if_many = true,
			},
			multilines = {
				enabled = true,
				always_show = true,
				severity = {
					vim.diagnostic.severity.ERROR,
				},
			},
		},
	},
}
