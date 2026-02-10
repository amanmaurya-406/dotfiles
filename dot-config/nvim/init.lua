vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'config.lazy'
require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

vim.api.nvim_set_hl(0, 'WinSeparator', {
  fg = '#0f83f0',
  bg = 'NONE',
})
