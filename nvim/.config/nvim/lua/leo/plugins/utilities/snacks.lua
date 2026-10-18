return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = { enabled = true, theme = { inactiveBorderColor = { fg = "Normal" } } },
		bigfile = { enabled = true },
		input = {},
	},
    --stylua: ignore
	keys = {
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
,
}
