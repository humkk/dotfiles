return {
	"folke/tokyonight.nvim",
	lazy = false, -- load at startup
	priority = 1000, -- load before other plugins
	config = function()
		require("tokyonight").setup({
			style = "night", -- night, storm, moon, day
			transparent = true,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
