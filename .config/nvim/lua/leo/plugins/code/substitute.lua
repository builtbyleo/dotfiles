return {
	"gbprod/substitute.nvim",
	opts = {
		range = {
			prefix = "r",
		},
	},
	config = function(_, opts)
		require("substitute").setup(opts)
		vim.keymap.set("n", "r", require("substitute").operator, { noremap = true })
		vim.keymap.set("n", "rr", require("substitute").line, { noremap = true })
		vim.keymap.set("n", "R", require("substitute").eol, { noremap = true })
		vim.keymap.set("x", "r", require("substitute").visual, { noremap = true })
	end,
}
