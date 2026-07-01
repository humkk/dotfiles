-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	-- audio
	hl.exec_cmd("pipewire")
	hl.exec_cmd("wireplumber")
	hl.exec_cmd("pipewire-pulse")

	-- wallpaper
	hl.exec_cmd("awww-daemon")

	-- waybar
	hl.exec_cmd("waybar")

	-- USB identification
	hl.exec_cmd("gvfs-udisks2-volume-monitor")
end)
