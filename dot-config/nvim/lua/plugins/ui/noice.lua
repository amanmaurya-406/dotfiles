-- Highly experimental plugin that completely replaces the command-line UI, messages, and popup notifications.
return {
  'folke/noice.nvim',

  lazy = false,
  priority = 1000,

  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  enabled = true,

  config = function()
    require('noice').setup {

      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- routes = {
      --   {
      --     view = 'notify',
      --     filter = { event = 'msg_showmode' },
      --   },
      -- },
      presets = {
        bottom_search = false, -- set true to use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      cmdline = {
        enabled = true, -- enables the noice cmdline UI
        view = 'cmdline_popup', -- view for rendering the cmdline

        opts = {},
        format = {
          cmdline = { pattern = '^:', icon = ' ', lang = 'vim' },
          search_up = { kind = 'search', pattern = '^%?', icon = '  ', lang = 'regex' },
          search_down = { kind = 'search', pattern = '^/', icon = '  ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = ' ', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '󰋖 ' },
        },
      },

      messages = {
        enabled = true,
        view = 'notify',
        view_error = 'notify',
        view_warn = 'notify',
        view_history = 'notify',
        view_search = 'virtualtext',
      },

      redirect = {
        view = 'popup',
        filter = { event = 'msg_show' },
      },

      views = {
        cmdline_popup = {
          position = { row = 3, col = '50%' }, -- centered horizontally
          size = { width = 60, height = 'auto' },
          border = { style = 'rounded' },
          win_options = {
            winblend = 0,
            wrap = true,
            linebreak = true,
            winhighlight = {
              Normal = 'NormalFloat',
              FloatBorder = 'FloatBorder',
            },
          },
        },
      },

      notify = {
        enabled = true,
        view = 'notify',
      },
    }
  end,
}
