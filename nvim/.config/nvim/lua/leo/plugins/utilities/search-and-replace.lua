return {
	"MagicDuck/grug-far.nvim",
	opts = {
		headerMaxWidth = 80,
		windowCreationCommand = "split",
		showCompactInputs = true,
	},
	cmd = "GrugFar",
	keys = {
		{
			"<leader>ra",
			function()
				require("grug-far").open({
					prefills = {
						search = vim.fn.expand("<cword>"),
					},
				})
			end,
			desc = "Search current word",
		},
	},
}
