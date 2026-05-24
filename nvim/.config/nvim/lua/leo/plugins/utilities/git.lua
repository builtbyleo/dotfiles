return {
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{
		"esmuellert/codediff.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		cmd = "CodeDiff",
		opts = {
			highlights = {
				-- line_insert = "#20281C",
				-- line_delete = "#281C22",
				-- char_insert = "#3fb950",
				-- char_delete = "#ff7b72",
			},
			keymaps = {
				view = {
					next_hunk = "]h", -- Jump to next change
					prev_hunk = "[h", -- Jump to previous change
				},
			},
		},
	      -- stylua: ignore
	       keys = {
	           { "<leader>gd",":CodeDiff file HEAD<CR>", desc = "Diff entire buffer" },
	       },
	},
	{
		"echasnovski/mini.diff",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			view = {
				style = "sign",
				signs = { add = "▎", change = "▎", delete = "▎" },
			},
			options = {
				wrap_goto = true,
			},
		},
        --stylua: ignore
		keys = {
			{ "<leader>gt", function() MiniDiff.toggle_overlay(0) end, desc = "Toggle diff overlay" },
			{ "<leader>gr", function() return MiniDiff.operator("reset") .. "gh" end, desc = "Reset hunk under cursor" },
			{
				"<leader>gr",
				function()
					local line_start = math.min(vim.fn.line("."), vim.fn.line("v"))
					local line_end = math.max(vim.fn.line("."), vim.fn.line("v"))
					MiniDiff.do_hunks(0, 'reset', { line_start = line_start, line_end = line_end })
				end,
				mode = "v",
				desc = "Reset selected hunks",
			},
			{ "<leader>gR", function() MiniDiff.do_hunks(0, 'reset', { line_start = 1, line_end = vim.fn.line('$') }) end, desc = "Reset buffer" },
		},
	},
}
