return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "biome" },
				solidity = { "forge_fmt" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
				python = { "ruff" },
			},
			formatters = {
				forge_fmt = {
					command = vim.fn.exepath("forge") ~= "" and vim.fn.exepath("forge") or "forge",
					args = { "fmt" },
					stdin = false,
					cwd = require("conform.util").root_file({ "foundry.toml" }),
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
