return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})
		require("nvim-treesitter").install({
			"lua",
			"json",
			"css",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
