-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',

  branch = 'main',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    local ts = require 'nvim-treesitter'

    ts.setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }

    ts.install{
      'c',
      'cpp',
      'vim',
      'lua',
      'diff',
      'html',
      'bash',
      'regex',
      'query',
      'vimdoc',
      'luadoc',
      'markdown',
      'markdown_inline',
    }
  end,
}
