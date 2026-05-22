return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10,
	opts = {
		overwrite = {
			undo = {
				enabled = true,
			},
			redo = {
				enabled = true,
			},
		},
		substitute = {
			enabled = true,
		},
	},
}
