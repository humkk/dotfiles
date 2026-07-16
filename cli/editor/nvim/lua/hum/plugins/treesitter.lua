return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"json",
				"css",
				"markdown",
				"markdown_inline",
				"vim",
				"vimdoc",
				"qmljs",
			},
			highlight = {
				enable = true,
			},
		})
		vim.treesitter.language.register("qmljs", "qml")
	end,
}
