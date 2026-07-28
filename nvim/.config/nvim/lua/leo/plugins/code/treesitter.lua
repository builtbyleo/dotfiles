return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = "VeryLazy",
		cmd = { "TSUpdate", "TSInstall", "TSUninstall" },
		opts = {
			ensure_installed = {
				"bash",
				"rust",
				"c",
				"diff",
				"doxygen",
				"html",
				"hyprlang",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
		},
		config = function(_, opts)
			local ts = require("nvim-treesitter")
			vim.filetype.add({
				pattern = { [".*%.conf"] = "bash" },
			})

			-- Install missing parsers
			local installed = ts.get_installed and ts.get_installed() or {}
			local installed_set = {}
			for _, lang in ipairs(installed) do
				installed_set[lang] = true
			end

			local to_install = vim.tbl_filter(function(lang)
				return not installed_set[lang]
			end, opts.ensure_installed or {})

			if #to_install > 0 then
				ts.install(to_install)
			end

			-- Enable treesitter features on FileType
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					-- Highlighting
					pcall(vim.treesitter.start, ev.buf)
					-- Indentation
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{ "windwp/nvim-ts-autotag", event = { "BufRead" }, opts = {} },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = "VeryLazy",
		opts = {
			select = {
				enable = true,
			},
		},
	},
	{
		"nvim-mini/mini.nvim",
		opts = function(_, opts)
			local ai = require("mini.ai")
			opts.ai = {
				n_lines = 500,
				custom_textobjects = {
					-- treesitter-based
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),

					-- pattern-based
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					d = { "%f[%d]%d+" }, -- digits
					e = { -- word with case (camelCase, snake_case, etc.)
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},

					-- function calls
					u = ai.gen_spec.function_call(), -- function call including dot (e.g., foo.bar())
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot
				},
			}
		end,
	},
}
