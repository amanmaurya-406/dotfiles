-- Bracket Pair Colorization
-- Different colors for brackets/parentheses " () {} [] "

return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    local rainbow = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow.strategy.global,
        c = rainbow.strategy['global'],
        cpp = rainbow.strategy['global'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
    }
  end,
}
