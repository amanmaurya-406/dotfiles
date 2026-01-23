-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Enable line number for man pages
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'man',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.wo.wrap = true
    vim.bo.bufhidden = 'wipe'
  end,
})

-- save and load folds automatically in views
-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  command = 'silent! mkview',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  command = 'silent! loadview',
})
