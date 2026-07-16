return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      '%.cache/',
      '%.local/',
      '%.dbus/',
      '%.oh%-my%-zsh/',
      '%.bash_history',
      '%.bash_logout',
      '%.bash_profile',
      '%.bashrc',
      '%.zshrc',
      '%.zsh_history',
      '%.zcompdump.*',
      '%.shell.*',
      },
    },
    pickers = {
	find_files = {
		hidden = true,
	},
    },
    extensions = {},
    }
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'Help tags' })
  end,
}
