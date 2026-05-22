return {
	{
		"folke/ts-comments.nvim",
		event = "BufEnter",
		config = true,
	},
	{
		"nvim-mini/mini.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			-- Each mini module as separate setup call
			require("mini.surround").setup()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.bracketed").setup()
			require("mini.cursorword").setup()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
			-- mini.ai with custom text objects
			local ai = require("mini.ai")
			ai.setup({
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
			})
		end,
	},
}
