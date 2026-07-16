local vars = require("variables")
local fn = require("modules.functions")

local mod = vars.mainMod or "SUPER" -- keep everything driven off one source of truth

-- ============================================================
-- 	Special workspace apps (toggle-or-launch)
-- ============================================================

local specialApps = {
	{ key = "D", class = "vesktop", exec = "vesktop-bin", special = "communication" },
	{ key = "M", class = "freetube", exec = "freetube-bin", special = "music" },
	{ key = "K", class = "org.keepassxc.KeePassXC", exec = "keepassxc", special = "security" },
}
for _, app in ipairs(specialApps) do
	hl.bind(mod .. " + " .. app.key, fn.toggleOrLaunch(app.class, app.exec, app.special))
end

-- ============================================================
-- 	Apps
-- ============================================================

hl.bind(mod .. " + Q", hl.dsp.exec_cmd(vars.terminal))
hl.bind(mod .. " + W", hl.dsp.window.close())
hl.bind(mod .. " + C", hl.dsp.exec_cmd(vars.terminal .. " " .. vars.calendar))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(vars.terminal .. " " .. vars.fileManager))
hl.bind(mod .. " + A", hl.dsp.exec_cmd(vars.terminal .. " " .. vars.editor))

hl.bind(mod .. " + B", hl.dsp.exec_cmd(vars.browser))
hl.bind(mod .. " + ALT + P", hl.dsp.exec_cmd(vars.audioSettings))
hl.bind(mod .. " + ALT + E", hl.dsp.exec_cmd(vars.fileManagerGui))

hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd(vars.terminal .. " " .. vars.taskManager))

-- ============================================================
-- 	Utilities
-- ============================================================

hl.bind(mod .. " + SHIFT + X", hl.dsp.exec_cmd("bash -c 'grim -g \"$(slurp)\" - | wl-copy --type image/png'"))

-- ============================================================
-- 	Workspaces (focus + move)
-- ============================================================

for i = 1, 10 do
	local key = i % 10
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- ============================================================
-- 	Window focus / move (directional)
-- ============================================================

local directions = { left = "left", right = "right", up = "up", down = "down" }

for name, dir in pairs(directions) do
	hl.bind(mod .. " + " .. name, hl.dsp.focus({ direction = dir }))
	hl.bind(mod .. " + SHIFT + " .. name, hl.dsp.window.move({ direction = dir }))
end

-- ============================================================
-- 	Window resize (directional, step = 45px)
-- ============================================================

local resizeStep = 45
local resizeVectors = {
	right = { x = resizeStep, y = 0 },
	left = { x = -resizeStep, y = 0 },
	down = { x = 0, y = resizeStep },
	up = { x = 0, y = -resizeStep },
}

for name, vec in pairs(resizeVectors) do
	hl.bind(
		mod .. " + ALT + " .. name,
		hl.dsp.window.resize({ x = vec.x, y = vec.y, relative = true }),
		{ repeating = true }
	)
end

-- ============================================================
-- 	Mouse binds
-- ============================================================

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ============================================================
-- 	Window state
-- ============================================================

hl.bind(mod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind("CTRL + SUPER + slash", hl.dsp.window.center())

-- ============================================================
-- 	Session
-- ============================================================

hl.bind(
	mod .. " + SHIFT + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
