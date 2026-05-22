return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		options = {
			show_source = {
				enabled = true,
				if_many = true,
			},
			multilines = {
				enabled = true,
				always_show = true,
			},
		},
	},
}
