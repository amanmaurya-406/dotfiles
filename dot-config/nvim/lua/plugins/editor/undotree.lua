return {
  'jiaoshijie/undotree',
  enabled = true,

  opts = {
    position = 'left',
    width = 30, -- column width
    auto_open = false,
    focus_on_open = true,
  },

  keys = {
    {
      '<leader>u',
      function()
        require('undotree').toggle()
      end,
      desc = 'Toggle undo tree',
    },
  },
}
