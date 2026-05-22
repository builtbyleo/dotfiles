local nvim_config_dir = vim.fn.stdpath("config")
local nvim_config_realpath = (vim.uv or vim.loop).fs_realpath(nvim_config_dir) or nvim_config_dir
local dotfiles_dir = vim.fn.expand(vim.env.DOTFILES_DIR or vim.fn.fnamemodify(nvim_config_realpath, ":h:h:h"))
local dashboard_image = vim.fn.shellescape(("%s/assets/crop.png"):format(nvim_config_dir))

local function edit_dotfile(name, file)
	local config_dir = ("%s/%s/.config/%s"):format(dotfiles_dir, name, name)

	return ("<cmd>cd %s | edit %s<CR>"):format(
		vim.fn.fnameescape(config_dir),
		vim.fn.fnameescape(file)
	)
end

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			preset = {
				keys = {
					{
						key = "c",
						icon = "   Nvim Config",
						action = edit_dotfile("nvim", "init.lua"),
					},
					{
						key = "g",
						icon = "   Ghostty Config",
						action = edit_dotfile("ghostty", "config"),
					},
					{
						key = "t",
						icon = "   Tmux Config",
						action = edit_dotfile("tmux", "tmux.conf"),
					},
					{ key = "u", icon = "󰂖   Update plugins", action = "<cmd>lua require('lazy').sync()<CR>" },
					{ key = "q", icon = "   Quit NVIM", action = "<cmd>:qa<CR>" },
				},
				-- header = [[
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⢾⢿⢟⢝⠻⢓⠲⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣆⢛⡇⡡⠑⠠⠀⠀⠈⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⢆⣿⣟⣫⣞⡝⢵⡈⡄⠀⠀⠀⠀⡙⣻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣾⣿⣿⣿⣿⣿⣿⣻⣝⣇⠥⠡⠠⠐⡀⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣧⢿⢿⣿⣿⣿⣿⣿⣿⣿⡷⠓⢩⡭⠄⠢⠘⣷⡀⠀⠀⠀⠀⠀⣠⡴⠟⣻⡿⡿⣿⣦⡀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣯⣳⣝⡿⣿⣿⣿⡿⣿⡿⡉⢐⠙⠳⢓⠀⢂⠨⡿⣦⠀⠀⠀⢰⠋⣄⡤⠖⠲⢍⠑⡻⣿⡄⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⣀⡤⠖⠒⡒⡒⡢⣤⡀⠀⠈⠻⢿⣿⣽⣿⣿⣿⣿⢆⣼⣮⣄⠸⡅⠄⢠⢸⣽⠇⠀⠀⠀⢸⠀⣼⡀⠀⠀⠀⢱⠩⣿⣼⠀⠀⠀⠀⠀
				--  ⠀⢠⡾⠋⣤⠞⠛⠉⠉⠛⠳⣌⣢⡀⠀⠀⠉⠙⠛⠛⢿⣿⣾⣿⣾⣿⣷⢧⠅⢨⡀⡏⠀⣠⡄⠀⠈⢧⡳⣻⡄⠀⠀⢸⢐⣺⣿⠁⠀⠀⠀⠀
				--  ⢠⣿⠡⣽⠃⠀⠀⠀⠀⠀⠀⠈⣧⢷⠀⠀⠀⠀⣀⣴⣿⣿⣿⣷⠭⠿⣗⢡⣁⠀⢮⣧⠀⣿⡁⠀⠀⠀⠹⡜⣿⡀⠀⢸⢐⣺⣿⠀⠀⠀⠀⠀
				--  ⣼⡇⡊⣿⠀⠀⠀⠀⠀⠀⠀⠀⣼⣼⠀⣠⡴⣿⣿⣾⣾⢏⢿⡷⣒⢙⣓⣓⡪⠀⢺⡾⣦⢻⣟⣦⣤⣤⢴⣷⡿⠁⣰⢃⣢⣿⠏⠀⠀⠀⠀⠀
				--  ⣿⡇⠂⠸⡄⠀⠀⠀⠀⠠⣤⣾⠿⢃⣞⣷⢿⢫⣿⡿⠣⢒⠽⣊⠅⠀⢲⣶⡍⠓⠀⢯⡪⢳⢭⣛⣛⣛⣛⣋⡵⠚⠁⢴⣮⢏⣴⠶⠶⣦⣄⠀
				--  ⢻⠿⡐⠄⠹⣄⡀⠀⠀⠀⠀⢀⣠⠾⣫⢞⣾⡾⠋⢤⢊⣷⣿⡆⠀⣫⣵⣶⣶⣌⣅⢸⣷⣷⡢⡈⣉⠉⠉⡀⡠⢐⣨⠟⠁⠘⢧⡶⠀⠈⢻⣣
				--  ⠈⢿⣿⣬⡢⡀⠙⠓⠶⠶⠚⡉⣠⣸⣯⡿⠋⢀⠢⣡⣿⣿⣿⠃⡮⣿⣿⡿⣿⣿⡨⡋⢿⣿⣿⡿⠾⠶⠷⠷⠛⠉⠀⠀⣀⣀⣀⣀⡀⠀⣸⢿
				--  ⠀⠀⠑⠯⣾⣷⣷⣴⣦⠴⠼⠷⠛⠋⡁⡰⢐⣥⣾⣿⣿⣿⠃⣴⣪⣿⡯⠔⣹⣟⣇⢮⡈⢿⣷⣿⣦⡀⠀⠀⠀⢀⡠⠊⣡⣶⠤⠬⠭⠽⠽⠃
				--  ⠀⠀⠀⠀⡬⠛⡩⡡⠄⢄⣴⣀⣖⣚⣬⣶⣿⣿⣿⡵⠋⣁⣔⣿⣿⡿⣙⢡⢿⣿⣿⡔⠦⡈⢿⣷⣷⣹⣓⢒⢒⢋⣴⣗⠟⠁⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⡞⠀⣺⣷⠿⠯⣽⣿⡿⠿⠿⠟⣿⣿⠟⢉⣤⢜⣽⣿⣿⡿⠥⢳⣾⡿⠋⢿⣿⡆⠪⢆⠙⠻⢿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⢰⣇⢐⣾⠁⣰⣫⠟⠓⢮⣳⡀⢠⠟⢠⣶⣵⣷⣟⣿⣿⠟⣡⣴⣿⠟⠁⠀⠈⠻⣿⣧⣤⡑⠓⣄⢤⢉⢙⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⣿⣦⡹⣄⢻⣳⣈⣿⠈⡇⡇⡏⠰⣻⡿⡭⢛⣽⠏⣤⣾⠿⠏⠁⢠⣔⣦⣴⡲⣄⠙⠿⣯⣿⣲⣖⣶⢥⣕⢌⠻⣄⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠘⢿⣷⣟⡺⢭⣿⣥⢾⣵⣿⣇⡋⣿⣾⠁⣾⢓⣽⡟⠋⠀⠀⠀⣧⠋⠁⠈⠙⣮⢣⠀⠀⢈⡩⢍⡉⠙⢿⣷⠤⢹⡄⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠙⠻⠿⠷⠷⠿⠛⣽⡟⣇⠅⣿⣧⠀⣿⡅⡏⠀⠀⡤⣖⣲⣷⡷⠶⠆⠀⢸⣺⡆⣴⢫⠏⠉⠉⠀⠀⣿⠨⢸⡇⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⣿⠿⡬⡹⡼⣄⢿⣦⠱⣄⣞⣼⠏⠉⢻⣷⠀⠀⢀⣾⣾⠙⣿⢨⠀⠀⠀⠀⣰⠏⣢⡿⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠁⢠⣿⡿⠀⠹⢮⣙⡻⠽⢿⣷⣌⠻⢿⣀⣰⠟⣃⣀⢤⣪⣿⠇⠀⠻⣪⣗⡦⠤⢞⣫⣶⡟⠁⠀⠀⠀⠀⠀⠀⠀
				--  ⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⣶⣫⠟⠁⠀⠀⠀⠙⠛⠛⠛⠛⠻⣿⣾⣼⣭⡭⣿⣷⠻⠟⠁⠀⠀⠀⠈⠛⠻⠿⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
				--     ]],
			},
			sections = {
				{
					section = "terminal",
					cmd = ("chafa %s --symbols vhalf --color-extractor median --size 40x40 --scale 1"):format(dashboard_image),
					height = 20,
					padding = 1,
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},
	},
}
