return {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {},
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				dap = {},
				server = {
					default_settings = {
						["rust-analyzer"] = {
							rustfmt = {
								extraArgs = { "+nightly" },
							},
						},
					},
				},
			}
		end,
	},
}
