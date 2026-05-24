return {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {},
		ft = "toml",
		lazy = true,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		ft = { "rust" },
		lazy = false,
		config = function()
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
