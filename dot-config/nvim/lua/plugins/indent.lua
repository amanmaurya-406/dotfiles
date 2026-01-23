return {
  -- Detect tabstop and shiftwidth automatically
  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPost',
    enabled = true,

    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPre',
    enabled = true,

    opts = {
      indent = {
        char = '┊',
        tab_char = '│',
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,

        -- THIS highlights the innermost indent only
        highlight = { 'IblScope' },
      },
    },
  },

  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  {
    'nvim-mini/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'Trouble',
          'alpha',
          'dashboard',
          'fzf',
          'help',
          'lazy',
          'mason',
          'neo-tree',
          'notify',
          'sidekick_terminal',
          'snacks_dashboard',
          'snacks_notif',
          'snacks_terminal',
          'snacks_win',
          'toggleterm',
          'trouble',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'SnacksDashboardOpened',
        callback = function(data)
          vim.b[data.buf].miniindentscope_disable = true
        end,
      })
    end,
  },

  -- disable indent-blankline scope when mini-indentscope is enabled
  {
    'lukas-reineke/indent-blankline.nvim',
    optional = true,
    event = 'BufReadPre',

    opts = {
      scope = { enabled = false },
    },
  },
}
