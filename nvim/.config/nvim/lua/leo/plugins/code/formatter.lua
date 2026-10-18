return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "oxfmt" },
				typescript = { "oxfmt" },
				javascriptreact = { "oxfmt" },
				typescriptreact = { "oxfmt" },
				svelte = { "oxfmt" },
				css = { "oxfmt" },
				html = { "oxfmt" },
				json = { "oxfmt" },
				jsonc = { "oxfmt" },
				yaml = { "oxfmt" },
				lua = { "stylua" },
				python = { "ruff" },
				solidity = { "forge_fmt" },
				astro = { "oxfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				markdown = { "oxfmt" },
			},
			format_on_save = function()
				if vim.g.autoformat == false then
					return
				end
				return {
					timeout_ms = 1000,
					lsp_format = "fallback",
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
