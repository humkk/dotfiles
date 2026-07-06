local colors = require("themes.colors")

return {

	-- Apps
	terminal = "kitty",
	fileManager = "yazi",
	editor = "nvim",
	calendar = "calcurse",
	taskManager = "btop",

	browser = "librewolf",
	audioSettings = "pavucontrol",
	passwordManager = "keepassxc",
	fileManagerGui = "nautilus",

	-- Blur
	blurEnabled = true,
	blurSpecialWs = false,
	blurPopups = true,
	blurInputMethods = true,
	blurSize = 8,
	blurPasses = 2,
	blurXray = false,

	-- Shadow
	shadowEnabled = true,
	shadowRange = 10,
	shadowRenderPower = 4,
	shadowColour = colors.shadow,

	-- Gaps
	workspaceGaps = 20,
	windowGapsIn = 5,
	windowGapsOut = 10,

	-- Window Styling
	windowOpacity = 0.95,
	windowRounding = 10,
	windowBorderSize = 2,
	activeWindowBorderColour = colors.primary,
	inactiveWindowBorderColour = colors.on_primary,

	-- Misc
	volumeStep = 10,
	volumeMax = 100,
	cursorTheme = "catppuccin-macchiato-pink-cursors",
	cursorSize = 24,
	sleepGestureCmd = "systemctl suspend-then-hibernate",
}
