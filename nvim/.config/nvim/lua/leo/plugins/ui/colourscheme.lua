return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false,
				terminal = true,
				overrides = {
					LineNr = { fg = "#636A72" },
					NonText = { fg = "#636A72" },
					["@variable.member"] = { fg = "#D2A6FF" },
					["@lsp.type.struct.rust"] = { fg = "#04C5FF" },
					["@lsp.mod.constant.rust"] = { fg = "#FFAA33" },
					["@type.tsx"] = { fg = "#04C5FF" },
					["@tag"] = { fg = "#04C5FF" },
					["@tag.builtin.tsx"] = { fg = "#04C5FF" },
					["@markup.heading"] = { fg = "#CCCAC2" },
					["@tag.attribute"] = { fg = "#FFB454" },
					-- ["@lsp.type.function.typescriptreact"] = { fg = "#04C5FF" },
					Comment = { italic = false },
					MiniDiffOverAdd = { bg = "#1D2214" },
					MiniDiffOverChange = { bg = "#2D2220" },
					MiniDiffOverChangeBuf = { bg = "#1B3A5B" },
					MiniDiffOverContext = { bg = "#11151C" },
					MiniDiffOverContextBuf = { bg = "#11151C" },
					MiniDiffOverDelete = { bg = "#2D2220" },
				},
			})

			vim.cmd.colorscheme("ayu")
		end,
	},
}
