return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier", "biome", stop_after_first = true },
				typescript = { "prettier", "biome", stop_after_first = true },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier", "biome", stop_after_first = true },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				python = { "ruff" },
				solidity = { "forge_fmt" },
				astro = { "prettier" },
				sh = { "beautysh" },
				zsh = { "beautysh" },
			},
			formatters = {
				prettier = {
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
