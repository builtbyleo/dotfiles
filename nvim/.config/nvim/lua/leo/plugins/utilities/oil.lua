return {
	"stevearc/oil.nvim",
	opts = {
		skip_confirm_for_simple_edits = true,
		delete_to_trash = true,
		float = {
			padding = 2,
			max_width = 0.6,
			max_height = 0.7,
			border = "rounded",
		},
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
			["-"] = false,
		},
		view_options = {
			show_hidden = true,
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>ef",
			function()
				require("oil").toggle_float()
			end,
			desc = "Toggle Oil float",
		},
	},
}
