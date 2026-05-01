return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Buscar arquivos" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Buscar texto" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Ver buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Buscar help" },
    },
  },
}