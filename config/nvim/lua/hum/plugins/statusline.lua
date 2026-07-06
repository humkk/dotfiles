return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "catppuccin/nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
				section_separators = "",
				component_separators = "|",
			},
		})
	end,
}
