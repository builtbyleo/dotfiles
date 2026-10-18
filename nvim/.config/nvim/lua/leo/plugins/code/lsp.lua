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
		opts = {
			ensure_installed = {
				"lua_ls",
				"ruff",
				"pyright",
				"vtsls",
				"gopls",
				"typos_lsp",
				"tailwindcss",
				"svelte",
				"jsonls",
			},
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact", "svelte", "astro" },
		opts = {},
	},
}
