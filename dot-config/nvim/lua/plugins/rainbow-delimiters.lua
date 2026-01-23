-- Bracket Pair Colorization
-- Different colors for brackets/parentheses " () {} [] "

local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPre',

  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
      },

      query = {
        [''] = 'rainbow-delimiters',
      },

      highlight = highlight,
    }
  end,
}
