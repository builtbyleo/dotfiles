return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "biome", stop_after_first = true },
				typescript = { "prettierd", "biome", stop_after_first = true },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				svelte = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd", "biome", stop_after_first = true },
				jsonc = { "prettierd" },
				yaml = { "prettierd" },
				lua = { "stylua" },
				python = { "ruff" },
				solidity = { "forge_fmt" },
				astro = { "prettierd" },
				sh = { "shfmt" },
			},
			formatters = {
				prettierd = {
					cwd = require("conform.util").root_file({
						".prettierrc",
						".prettierrc.json",
						".prettier.config.js",
						".git",
					}),
					require_cwd = true,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
