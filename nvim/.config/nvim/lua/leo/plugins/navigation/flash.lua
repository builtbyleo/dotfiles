return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			pos = "end",
			autojump = true,
		},
	},
  -- stylua: ignore
 keys = {
        { "<CR>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<leader><CR>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "<C-space>", mode = { "n", "x", "o" }, function()
          require("flash").treesitter({ actions = { ["<C-space>"] = "next", ["<BS>"] = "prev" }}) end,
        desc = "Treesitter incremental selection" },
  },
}
