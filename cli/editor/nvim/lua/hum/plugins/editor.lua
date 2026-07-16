return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = {
					enabled = true,
				},
			},
		})

		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
	end,
}
