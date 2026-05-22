return {
	"xzbdmw/clasp.nvim",
	priority = 1000,
	config = function()
		require("clasp").setup({
			pairs = { ["{"] = "}", ['"'] = '"', ["'"] = "'", ["("] = ")", ["["] = "]", ["<"] = ">" },
			keep_insert_mode = true,
			remove_pattern = nil,
		})

		vim.keymap.set({ "i" }, "<c-n>", function()
			require("clasp").wrap("next", function(nodes)
				local n = {}
				for _, node in ipairs(nodes) do
					if node.end_row == vim.api.nvim_win_get_cursor(0)[1] - 1 then
						table.insert(n, node)
					end
				end
				return n
			end)
		end)
		vim.keymap.set({ "i" }, "<c-p>", function()
			require("clasp").wrap("prev")
		end)
	end,
}
