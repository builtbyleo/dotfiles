-- allows moving highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursor stays in same place when moving up and down the page
-- or when pasting
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Save current buffer
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Save all buffers and quit
vim.keymap.set("n", "<leader>q", "<cmd>wqa<cr>", { desc = "Save all and quit" })

-- Delete current buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- replace the current word
vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

-- reload file
vim.keymap.set("n", "<leader>br", "<cmd>e!<cr>", { desc = "Reload Buffer" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { noremap = false, desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.keymap.set("n", "<Up>", "<cmd>resize +3<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<Down>", "<cmd>resize -3<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +3<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -3<cr>", { desc = "Decrease Window Width" })

vim.keymap.set("x", "/", "<C-\\><C-n>`</\\%V", { desc = "Search forward within visual selection" })
vim.keymap.set("x", "?", "<C-\\><C-n>`>?\\%V", { desc = "Search backward within visual selection" })

local maximized = false

vim.keymap.set("n", "<leader>sm", function()
	if maximized then
		vim.cmd("wincmd =")
		maximized = false
	else
		vim.cmd("wincmd _")
		vim.cmd("wincmd |")
		maximized = true
	end
end, { desc = "Toggle maximize split" })
