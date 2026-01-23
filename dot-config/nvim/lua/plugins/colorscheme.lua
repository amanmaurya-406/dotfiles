return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = true,

    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true },
        },
      }

      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
          vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
          vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
          vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
          vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
          vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
          vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
        end,
      })

      vim.cmd.colorscheme 'tokyonight-moon' -- 'tokyonight-storm', 'tokyonight-night', or 'tokyonight-day'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    enabled = false,

    config = function()
      require('catppuccin').setup {
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
        },
      }

      vim.cmd.colorscheme 'catppuccin-mocha' -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato
    end,
  },
}
