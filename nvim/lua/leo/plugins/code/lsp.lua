return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Configure denols and vtsls to not conflict
			vim.lsp.config("denols", {
				root_dir = function(bufnr, on_dir)
					local root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
					if root then
						on_dir(root)
					end
				end,
			})

			vim.lsp.config("vtsls", {
				root_dir = function(bufnr, on_dir)
					-- Skip if deno project
					if vim.fs.root(bufnr, { "deno.json", "deno.jsonc" }) then
						return
					end
					local root = vim.fs.root(bufnr, { "package.json", "tsconfig.json" })
					if root then
						on_dir(root)
					end
				end,
			})
		end,
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
				"vtsls",
				"emmet_language_server",
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
