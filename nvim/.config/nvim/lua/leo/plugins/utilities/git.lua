return {
	{
		"CoreyKaylor/diffbandit.nvim",
		cmd = {
			"DiffBandit",
			"DiffBanditBuffers",
			"DiffBanditFolderDiff",
			"DiffBanditGit",
			"DiffBanditGitCurrent",
			"DiffBanditCommitPanel",
			"DiffBanditGitMenu",
			"DiffBanditGitLog",
			"DiffBanditGitCommit",
			"DiffBanditGitCompare",
			"DiffBanditGitCheckout",
			"DiffBanditMerge",
		},
		opts = {
			actions = { keys = { toggle_stage = "-" } },
			git = { panel = { keys = { toggle_stage = "-", toggle_amend = "ga" } } },
			folder = { keys = { toggle_expand = "<Tab>" } },
			ui = {
				kitty = {
					cell_px = { 17, 41 },
					image_colorspace = "srgb",
				},
			},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>gd", "<Cmd>DiffBanditGitCurrent<CR>", desc = "Diff entire buffer" },
		},
	},
	{
		"nvim-mini/mini.nvim",
		opts = {
			diff = {
				view = {
					style = "sign",
					signs = { add = "▎", change = "▎", delete = "▎" },
				},
				options = {
					wrap_goto = true,
				},
			},
		},
        --stylua: ignore
		keys = {
			{ "<leader>gt", function() MiniDiff.toggle_overlay(0) end, desc = "Toggle diff overlay" },
			{ "<leader>gr", function() return MiniDiff.operator("reset") .. "gh" end, mode = "n", expr = true, remap = true, desc = "Reset hunk under cursor" },
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
