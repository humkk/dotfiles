-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod = "SUPER"
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())

----------
-- Apps --
----------

--- # VARIABLES

-- tui
local calendar = "calcurse"
local terminal = "kitty"
local fileManager = "yazi"
local editor = "nvim"

-- gui
local guiFileManager = "nautilus"
local guiAudioSettings = "pavucontrol"
local guiBrowser = "librewolf"
local guiPasswdManager = "keepassxc"

--- # ACTIONS

-- tui
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal .. " " .. calendar))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(terminal .. " " .. fileManager))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(terminal .. " " .. editor))

-- gui
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(guiBrowser))
hl.bind(mainMod .. " + ALT + E", hl.dsp.exec_cmd(guiFileManager))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(guiAudioSettings))
hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd(guiPasswdManager))

-- others
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("bash -c 'grim -g \"$(slurp)\" - | wl-copy --type image/png'"))

----------------
-- Workspaces --
----------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end

--------------------
-- Window actions --
--------------------

-- move focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- move window
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- resize window
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 45, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + left", hl.dsp.window.resize({ x = -45, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.resize({ x = 0, y = 45, relative = true }), { repeating = true })
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.resize({ x = 0, y = -45, relative = true }), { repeating = true })
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- full screen
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Other
hl.bind("CTRL + SUPER + slash", hl.dsp.window.center())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
