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
			format_on_save = function()
				if vim.g.autoformat == false then
					return
				end
				return {
					timeout_ms = 1000,
					lsp_fallback = true,
				}
			end,
		})
	end,
	keys = {
		{
			"<leader>uf",
			function()
				vim.g.autoformat = not (vim.g.autoformat ~= false)
				vim.notify("Format on save " .. (vim.g.autoformat and "enabled" or "disabled"))
			end,
			desc = "Toggle Format on Save",
		},
	},
}
