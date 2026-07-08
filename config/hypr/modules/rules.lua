local vars = require("variables")

----------------------
---- Window rules ----
----------------------

hl.window_rule({ match = { fullscreen = false }, opacity = vars.windowOpacity .. " override" })
hl.window_rule({ match = { float = true, xwayland = false }, center = true }) -- Center all floating windows (not xwayland cause popups)

-- Floating Applications
hl.window_rule({
	match = {
		class = "guifetch|yad|zenity|wev|org.gnome.FileRoller|file-roller|blueman-manager|feh|imv|system-config-printer",
	},
	tag = "+float",
})
hl.window_rule({
	match = {
		title = "(Select|Open)( a)? (File|Folder)(s)?|File (Operation|Upload)( Progress)?|.* Properties|Export Image as PNG|GIMP Crash Debug|Save As|Library",
	},
	tag = "+float",
})
hl.window_rule({ match = { class = "steam", title = "Friends List" }, tag = "+float" })
hl.window_rule({ match = { class = "com-atlauncher-App", title = "ATLauncher Console" }, tag = "+float" })
hl.window_rule({ match = { class = "PandoraLauncher", title = "Minecraft Game Output" }, tag = "+float" })

-- MPV (floats at native video resolution)
hl.window_rule({ match = { class = "^mpv$" }, tag = "+float" })

hl.window_rule({ match = { tag = "float" }, float = true })

-- Opaque Apps
hl.window_rule({
	match = {
		class = "foot|imv|godot|(steam_app_(default|[0-9]+))",
	},
	tag = "+opaque_app",
})
hl.window_rule({ match = { tag = "opaque_app" }, opaque = true })

-- Sized & Centered Floaters
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol|yad-icon-browser" }, tag = "+float_60_70" })
hl.window_rule({ match = { class = "org.gnome.Settings" }, tag = "+float_70_80" })
hl.window_rule({ match = { class = "nwg-look" }, tag = "+float_50_60" })

hl.window_rule({
	match = { tag = "float_60_70" },
	float = true,
	size = "(monitor_w*0.6) (monitor_h*0.7)",
	center = true,
})
hl.window_rule({
	match = { tag = "float_70_80" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.8)",
	center = true,
})
hl.window_rule({
	match = { tag = "float_50_60" },
	float = true,
	size = "(monitor_w*0.5) (monitor_h*0.6)",
	center = true,
})

-- Games (Steam, Lutris/Wine, Gamescope)
hl.window_rule({
	match = { class = "(steam_app_(default|[0-9]+))|gamescope" },
	immediate = true,
	idle_inhibit = "always",
})
hl.window_rule({ match = { class = "steam" }, rounding = 10 })

-- Picture in picture (resize and move done via script)
hl.window_rule({
	match = { title = "Picture(-| )in(-| )[Pp]icture" },
	move = "(monitor_w*0.98-window_w) (monitor_h*0.97-window_h)",
	pin = true,
	float = true,
	keep_aspect_ratio = true,
})

-- Other
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

----------------------------------
---- Blur Applied to Software ----
----------------------------------

hl.layer_rule({
	name = "blur-waybar",
	match = { namespace = "^waybar$" },
	blur = true,
})

----------------------------
---- Special Workspaces ----
----------------------------

hl.window_rule({
	name = "communication-workspace",
	match = { class = "discord|vesktop|equibop|whatsapp" },
	workspace = "special:communication",
})

hl.window_rule({
	name = "midia-workspace",
	match = {
		class = "ncmpcpp|freetube",
	},
	workspace = "special:music",
})

hl.window_rule({
	match = {
		class = "^mpv$",
	},
	workspace = "special:magic",
})

hl.window_rule({
	name = "security-workspace",
	match = {
		class = "org.keepassxc.KeePassXC",
	},
	workspace = "special:security",
})
