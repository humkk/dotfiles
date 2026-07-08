local mp = require("mp")

local GAPS_OUT = 20
local T_Size = 0.8

local function resize_and_center()
	local dwidth = mp.get_property_number("dwidth")
	local dheight = mp.get_property_number("dheight")
	if not dwidth or not dheight then
		return
	end

	local handle = io.popen("hyprctl monitors -j")
	local mon_json = handle:read("*a")
	handle:close()

	local mon_w = tonumber(mon_json:match('"width":%s*(%d+)'))
	local mon_h = tonumber(mon_json:match('"height":%s*(%d+)'))
	if not mon_w or not mon_h then
		return
	end

	local available_w = (mon_w - GAPS_OUT * 2) * T_Size
	local available_h = (mon_h - GAPS_OUT * 2) * T_Size

	local scale = math.min(available_w / dwidth, available_h / dheight, 1)
	local w = math.floor(dwidth * scale)
	local h = math.floor(dheight * scale)

	local pid = mp.get_property_number("pid")
	local cmd =
		string.format('hyprctl dispatch "hl.dsp.window.resize({ x = %d, y = %d, window = \\"pid:%d\\" })"', w, h, pid)
	os.execute(cmd)
end

mp.register_event("file-loaded", function()
	mp.add_timeout(0.4, resize_and_center)
end)
