return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "zeioth/garbage-day.nvim", event = "VeryLazy", opts = {} },
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"ruff",
				"pyright",
				"vtsls",
				-- "emmet_language_server",
				"gopls",
				"typos_lsp",
				"tailwindcss",
				"svelte",
				"solidity_ls_nomicfoundation",
				"jsonls",
				"denols",
			},
			automatic_installation = true,
		},
	},
	{ "dmmulroy/ts-error-translator.nvim", opts = {} },
}
