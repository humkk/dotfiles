vim.keymap.set("n", "gx", function()
	local line = vim.api.nvim_get_current_line()
	local url = line:match("%((https?://[^%s%)]+)%)")
	if url then
		vim.ui.open(url)
	else
		vim.notify("No link found.", vim.log.levels.WARN)
	end
end, { desc = "Open makrdown link." })
