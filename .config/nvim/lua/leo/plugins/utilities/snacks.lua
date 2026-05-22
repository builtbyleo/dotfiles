return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true },
		bigfile = { enabled = true },
		input = {},
		zen = {
			win = {
				width = 130,
				backdrop = {
					transparent = false,
				},
			},
			toggles = {
				dim = false,
			},
		},
	},
    --stylua: ignore
	keys = {
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>z", function() Snacks.zen() end, desc = "Zen Mode" },
    }
,
}
