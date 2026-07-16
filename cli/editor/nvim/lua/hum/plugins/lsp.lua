return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.lsp.config("qmlls", {
			cmd = { "qmlls6" },
			filetypes = { "qml" },
		})
		vim.lsp.enable("qmlls")
	end,
}
