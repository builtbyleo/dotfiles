vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard:append("unnamedplus")

vim.opt.wrap = true
vim.opt.linebreak = true -- Break lines without cutting words
vim.opt.breakindent = true -- Preserve indentation for wrapped lines

vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- case sensitive when search has mixed case

vim.opt.background = "dark"
vim.o.winborder = "rounded"

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.virtualedit = "block"
vim.opt.updatetime = 250
vim.opt.confirm = true

vim.opt.hlsearch = false
vim.opt.inccommand = "split"

-- window split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- turn off swapfile, keep undo history between sessions
vim.opt.swapfile = false
vim.opt.undofile = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.fillchars:append({ eob = " " })

-- sometimes tmux file is seen as bash
vim.filetype.add({
	filename = {
		["tmux.conf"] = "tmux",
	},
})

-- simpler tabline
function _G.simple_tabline()
	local result = {}

	for tab = 1, vim.fn.tabpagenr("$") do
		local selected = tab == vim.fn.tabpagenr()
		local window = vim.fn.tabpagewinnr(tab)
		local buffer = vim.fn.tabpagebuflist(tab)[window]
		local name = vim.fn.bufname(buffer)

		if name == "" then
			name = "[Scratch]"
		else
			name = vim.fn.fnamemodify(name, ":.")
		end

		table.insert(result, selected and "%#TabLineSel#" or "%#TabLine#")
		table.insert(result, "%" .. tab .. "T  " .. name .. "  ")
	end

	table.insert(result, "%#TabLineFill#%T")
	return table.concat(result)
end

vim.opt.tabline = "%!v:lua.simple_tabline()"
