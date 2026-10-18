vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰠠",
			[vim.diagnostic.severity.INFO] = "",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.HINT] = "MoreMsg",
			[vim.diagnostic.severity.INFO] = "InfoMsg",
		},
	},
})

local keymap = vim.keymap

keymap.set("n", "Q", function()
	vim.diagnostic.open_float()
end, { desc = "open floating diagnostics" })

keymap.set("n", "gK", function()
	return vim.lsp.buf.signature_help()
end, { desc = "Signature Help" })

keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "Show documentation for what is under cursor" })

keymap.set("n", "<leader>xd", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, desc = "Toggle vim diagnostics" })
