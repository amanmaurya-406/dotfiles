return {
  '3rd/image.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require('nvim-treesitter').setup {
          ensure_installed = { 'markdown' },
          highlight = { enable = true },
        }
      end,
    },
  },
  opts = {
    backend = 'kitty',
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = 'inline', -- or "popup"
        floating_windows = true, -- if true, images will be rendered in floating markdown window
        filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
      },
      neorg = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        filetypes = { 'norg' },
      },
    },
    max_width = 50,
    max_height = 50,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    kitty_method = 'normal',
  },
}
