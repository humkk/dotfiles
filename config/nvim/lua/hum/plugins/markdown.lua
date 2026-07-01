return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown" }, -- only load for markdown files
	config = function()
		require("render-markdown").setup({
			heading = { enabled = true },
			bullet = { enabled = true },
			checkbox = { enabled = true },
			code = { enabled = true },
			inline_highlight = { enabled = true },
		})
	end,
}
