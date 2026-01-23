-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  enabled = true,

  config = function()
    require('nvim-treesitter').setup {
      indent = { enable = true },
      highlight = { enable = true },
      ensure_installed = {
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
      },
      auto_install = false,
    }
  end,
}
