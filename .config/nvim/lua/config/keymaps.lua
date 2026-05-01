local keymap = vim.keymap
keymap.set("n", "<leader>io", function()
  local line = vim.api.nvim_get_current_line()
  local path = line:match("!%[.-%]%((.-)%)")
  if path then
    local dir = vim.fn.expand("%:p:h")
    local fullpath = dir .. "/" .. path:gsub("^./", "")
    vim.fn.jobstart({ "ristretto", fullpath }, { detach = true })
  end
end, { desc = "Abrir imagem no Ristretto" })

-- MARKDOWN
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Ctrl+B → negrito **texto**
    vim.keymap.set("i", "<C-b>", "****<Left><Left>", { buffer = true, desc = "Markdown Bold" })
    -- Ctrl+I → itálico *texto*
    vim.keymap.set("i", "<C-i>", "**<Left>", { buffer = true, desc = "Markdown Italic" })
  end,
})