return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,

  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },

  opts = {
    filesystem = {
      window = {
        -- width = 30,
        mappings = {
          ['\\'] = 'close_window',
        },
      },

      -- Live refresh on save / rename
      enable_refresh_on_write = true,

      -- Detect external + internal file changes
      use_libuv_file_watcher = true,
    },

    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.cmd [[
            setlocal relativenumber
            setlocal number
          ]]
        end,
      },
      {
        event = 'file_opened',
        handler = function()
          vim.cmd 'Neotree close'
        end,
      },
    },
  },
}
