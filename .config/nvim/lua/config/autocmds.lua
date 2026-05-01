vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = "#c9beff", bg = "NONE" })
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Function" })
    if ok and hl.fg then
      vim.api.nvim_set_hl(0, "@markup.list.markdown", { fg = hl.fg })
    end
  end,
})