-- Rex config. Reload with `ctrl+a r` or `rex config reload`.
-- See what loaded: `rex keymap`. List app actions: `rex -C <client> actions`.
--
-- A key's bindings form a stack: the app runs the newest one it can perform and
-- falls back to older ones. If none can run, the key goes to the terminal.

-- Prefix ---------------------------------------------------------------------
-- ctrl+a starts a sequence; press it twice to send a real ctrl+a to the shell.
rex.bind("ctrl+a>ctrl+a", "pane.send_key", { key = "ctrl+a" })
rex.bind("ctrl+a>r", "client.config.reload")

-- Tabs (tmux "windows") ------------------------------------------------------
rex.bind("ctrl+a>c", "client.tab.new")
rex.bind("ctrl+a>shift+x", "client.tab.close") -- X
rex.bind("ctrl+a>,", "client.tab.rename")
rex.bind("ctrl+a>left", "client.tab.move.backward")
rex.bind("ctrl+a>right", "client.tab.move.forward")
for i = 1, 9 do
	rex.bind("ctrl+a>" .. i, "client.tab.goto", { index = i })
end

-- n/p wrap around: on the last tab "next" can't run, so the older binding
-- (go to tab 1) runs instead of the key leaking to the shell. Same for "p".
rex.action({
	name = "tab_last",
	title = "Go to Last Tab",
	run = function()
		local view, err = rex.session.view({})
		if view == nil then
			error(err, 0)
		end
		rex.client.queue("client.tab.goto", { index = #view.windows })
	end,
})
rex.bind("ctrl+a>n", "client.tab.goto", { index = 1 }) -- fallback
rex.bind("ctrl+a>n", "client.tab.next")
rex.bind("ctrl+a>p", "tab_last") -- fallback
rex.bind("ctrl+a>p", "client.tab.previous")

-- Sessions -------------------------------------------------------------------
rex.bind("ctrl+a>s", "session.switch") -- picker
rex.bind("ctrl+a>shift+s", "session.new") -- S
rex.bind("ctrl+a>shift+4", "session.rename") -- $
rex.bind("ctrl+a>shift+9", "session.previous") -- (
rex.bind("ctrl+a>shift+0", "session.next") -- )

-- Panes & splits -------------------------------------------------------------
-- Focus is ctrl+h/j/k/l via rex-navigator (bottom of file), shared with nvim.
rex.bind("ctrl+a>shift+\\", "pane.split", { direction = "right" }) -- |
rex.bind("ctrl+a>-", "pane.split", { direction = "down" })
rex.bind("ctrl+a>enter", "pane.split.auto") -- best fit, same as cmd+enter
rex.bind("ctrl+a>x", "pane.close")
rex.bind("ctrl+a>m", "pane.zoom")
rex.bind("ctrl+a>=", "pane.balance")
rex.bind("ctrl+a>f", "pane.float") -- float / unfloat
rex.bind("ctrl+a>shift+1", "pane.move_to_new_tab") -- !
rex.bind("ctrl+a>shift+[", "pane.move.left") -- {
rex.bind("ctrl+a>shift+]", "pane.move.right") -- }

-- Resize mode ----------------------------------------------------------------
-- ctrl+a h/j/k/l resizes once and enters resize mode, so further h/j/k/l keep
-- resizing (like tmux `bind -r`). enter or escape leaves.
rex.action({
	name = "resize_start",
	title = "Resize Pane (enter resize mode)",
	args = { direction = "string" },
	run = function(_, args)
		rex.client.queue("pane.resize", { direction = args.direction, amount = 5 })
		rex.client.queue("client.mode.enter", { name = "resize" })
	end,
})

rex.mode("resize", { exclusive = true })
for key, dir in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
	rex.bind("ctrl+a>" .. key, "resize_start", { direction = dir })
	rex.bind("resize/" .. key, "pane.resize", { direction = dir, amount = 5 })
	rex.bind("resize/shift+" .. key, "pane.resize", { direction = dir, amount = 15 })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/enter", "client.mode.exit") -- escape already leaves any mode

-- Extras ---------------------------------------------------------------------
rex.bind("ctrl+a>a", "client.sidebar.activity.toggle") -- also cmd+.
rex.bind("ctrl+a>/", "client.find.open")

-- Plugins --------------------------------------------------------------------
local data = os.getenv("XDG_DATA_HOME") or (os.getenv("HOME") .. "/.local/share")
local plugin = data .. "/nvim/lazy/rex-navigator.nvim"
local ok, err = pcall(function()
	dofile(plugin .. "/rex/navigator.lua").setup()
end)
if not ok then
	rex.log("warn", "rex-navigator not loaded: " .. tostring(err))
end
