local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("hum.plugins.telescope"),
	require("hum.plugins.editor"),
	require("hum.plugins.ui"),
	require("hum.plugins.formatting"),
	require("hum.plugins.treesitter"),
	require("hum.plugins.statusline"),
	require("hum.plugins.markdown"),
})
