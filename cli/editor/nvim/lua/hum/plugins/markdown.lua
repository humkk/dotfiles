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
			html = { enabled = false },
			latex = { enabled = false },
			yaml = { enabled = false },
			link = {
				enabled = true,
				render_modes = true, -- também esconde a URL mesmo com cursor na linha
			},
		})
	end,
}
