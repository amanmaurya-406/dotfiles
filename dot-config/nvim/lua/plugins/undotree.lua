return {
  'jiaoshijie/undotree',
  enabled = true,

  config = function()
    require('undotree').setup {
      position = 'left',
      width = 30, -- column width
      auto_open = false,
      focus_on_open = true,
    }

    local undotree = require 'undotree'
    vim.keymap.set('n', '<leader>u', undotree.toggle, { desc = 'Toggle [U]ndotree' })
  end,
}
