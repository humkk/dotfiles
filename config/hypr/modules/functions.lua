local M = {}

--- --------------------------- ---
--- SPECIAL WORKSPACES FUNCTION ---
--- --------------------------- ---

-- Toggle a special-workspace app into view, or launch it if not running.
-- class:       the window class to match (from `hyprctl clients`)
-- specialName: the name of the special workspace (used in rules.lua too)
function M.toggleOrLaunch(class, execCmd, specialName)
	return function()
		local found = false
		for _, w in pairs(hl.get_windows()) do
			if w.class == class then
				found = true
				break
			end
		end

		if found then
			hl.dispatch(hl.dsp.workspace.toggle_special(specialName))
		else
			hl.dispatch(hl.dsp.exec_cmd(execCmd))
		end
	end
end

return M
