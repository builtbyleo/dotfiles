return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			disabled_filetypes = { statusline = { "snacks_dashboard", "Avante" } },
			ignore_focus = {
				"dapui_watches",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dapui_stacks",
				"dap-repl",
				"AvanteInput",
				"AvanteSelectedFiles",
				"neo-tree",
			},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icon = { "" },
					separator = { right = " ", left = "" },
				},
			},
			lualine_b = {
				{ "filename", separator = { right = " ", left = "" } },
			},
			lualine_c = {
				{
					"branch",
					icon = { " " },
					separator = "",
					padding = 2,
				},
				{
					"diff",
					colored = true, -- Displays a colored diff status if set to true
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					source = nil,
					padding = 0,
				},
			},
			lualine_x = {
				{ "" },
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "󱤅 ",
						other = "󰠠 ",
					},
					colored = true,
					padding = 2,
				},
				"fileformat",
				"filetype",
			},
			lualine_y = {},
			lualine_z = {
				{
					"location",
					icon = { "", align = "left" },
					separator = { right = "", left = "" },
				},
				{
					"progress",
					icon = { "", align = "left" },
					separator = { right = "", left = "" },
				},
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = { "mason", "lazy" },
	},
}
