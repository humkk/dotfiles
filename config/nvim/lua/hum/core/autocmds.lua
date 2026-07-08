vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "/tmp/calcurse*", "~/.calcurse/notes/*" },
	command = "set filetype=markdown",
})

vim.filetype.add({
	extension = {
		qml = "qml",
	},
})
