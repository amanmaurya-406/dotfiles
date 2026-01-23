-- Lualine: Fast and customizable statusline for Neovim
-- Shows mode, git branch, diagnostics, file info, and more
-- Supports icons, themes, separators, and global statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  enabled = true,
  event = 'VeryLazy',

  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        icons_enabled = true,
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', icon = '' }, { 'diff' } },
        lualine_c = {
          {
            'buffers',
            show_only_filename = true,
            hide_filename_extension = false,
            show_modified_status = true,

            mode = 0, -- 0 = buffer name, 1 = number, 2 = number + name
            max_length = vim.o.columns * 0.7,
            filetype_names = {
              TelesscopePrompt = 'Telescope',
              dashboard = 'Dashboard',
            },
          },
          { 'diagnostics', sources = { 'nvim_diagnostic' } },
        },
        lualine_x = { { 'encoding' }, { 'fileformat' }, { 'filetype', icon_only = false } },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
