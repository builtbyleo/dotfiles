return {
	{
		dir = "~/Documents/experiments/carvion.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("carvion")
			vim.api.nvim_set_hl(0, "MiniNotifyNormal", { link = "Normal" })
		end,
	},
}
