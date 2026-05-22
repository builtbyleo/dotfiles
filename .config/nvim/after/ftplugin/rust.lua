local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "Q", function()
	vim.cmd.RustLsp({ "renderDiagnostic", "current" })
end, { silent = true, buffer = bufnr })
