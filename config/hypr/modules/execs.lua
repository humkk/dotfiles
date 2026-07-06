--local vars = require("variables")

hl.on("hyprland.start", function()
	-- audio
	hl.exec_cmd("pipewire")
	hl.exec_cmd("wireplumber")
	hl.exec_cmd("pipewire-pulse")

	-- Maintenance
	hl.exec_cmd("trash-empty 30") -- Auto delete trash 30 days old

	-- Desktop UI
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("dunst")
	hl.exec_cmd("calcurse --daemon")

	-- Storage
	hl.exec_cmd("gvfs-udisks2-volume-monitor") -- USB identification
end)
