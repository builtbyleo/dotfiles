return {
	{
		"folke/ts-comments.nvim",
		event = "BufEnter",
		config = true,
	},
	{
		"nvim-mini/mini.nvim",
		version = "*",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.bracketed").setup()
			require("mini.cursorword").setup()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
			require("mini.git").setup()
			require("mini.diff").setup(opts.diff)
			require("mini.statusline").setup()

			local notify = vim.notify
			require("mini.notify").setup(opts.notify)
			vim.notify = notify

			require("mini.clue").setup(opts.clue)
			require("mini.ai").setup(opts.ai)
		end,
	},
}
