return {

	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		event = "InsertEnter",
		opts = {
			keymap = {
				preset = "none",
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
			},
			cmdline = {
				keymap = {
					["<Tab>"] = { "show", "select_next", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<C-e>"] = { "hide", "fallback" },
				},
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { window = { border = "rounded" } },
				menu = {
					auto_show = function(ctx)
						local row, col = unpack(vim.api.nvim_win_get_cursor(0))
						local success, node = pcall(vim.treesitter.get_node, {
							pos = { row - 1, math.max(0, col - 1) },
							ignore_injections = false,
						})
						local reject = {
							"comment",
							"line_comment",
							"block_comment",
							"string_start",
							"string_content",
							"string_end",
						}
						if success and node and vim.tbl_contains(reject, node:type()) then
							return false
						end
						return true
					end,
					scrollbar = false,
					border = "rounded",
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				},
			},
			signature = { enabled = true, window = { border = "rounded" } },
			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			enabled = function()
				return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
					and vim.bo.filetype ~= "grug-far"
					and vim.bo.filetype ~= "oil"
					and vim.b.completion ~= false
			end,
		},
		opts_extend = { "sources.default" },
	},
	{
		"saghen/blink.indent",
		opts = {
			static = {
				char = "┊",
			},
			scope = {
				char = "┊",
				highlights = { "BlinkIndentOrange" },
			},
		},
	},
}
