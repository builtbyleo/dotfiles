return {
	{
		"nvim-mini/mini.nvim",
		opts = {
			notify = {
				lsp_progress = {
					enable = true,
				},
				window = {
					winblend = 0,
					config = function()
						local has_statusline = vim.o.laststatus > 0
						local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
						return {
							anchor = "SE",
							border = "none",
							col = vim.o.columns,
							row = vim.o.lines - pad,
						}
					end,
				},
			},
		},
	},
}
