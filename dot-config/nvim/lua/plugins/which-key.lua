-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'helix',
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.o.timeoutlen
    delay = 0,
    icons = {
      breadcrumb = '»', -- shows in the command line
      separator = '➜', -- between key and description
      group = '+', -- group prefix
      ellipsis = '…',
      mappings = vim.g.have_nerd_font,
    },

    keys = {
      scroll_down = '<c-j>', -- binding to scroll down inside the popup
      scroll_up = '<c-k>', -- binding to scroll up inside the popup
    },

    -- Document existing key chains
    spec = {
      mode = { 'n', 'x' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>t', group = '[T]oggle', mode = { 'n', 'v' } },
      { '<leader>-', desc = 'Horizontal split (below)' },
      { '<leader>|', desc = 'Vertical split (right)' },
      { '<leader>h', group = '[H]arpoon' },
      { '<leader>hd', group = '[D]elete' },
      { '[', group = 'prev' },
      { ']', group = 'next' },
      { 'g', group = 'goto' },
    },

    sort = { 'local', 'group', 'manual' },
  },
}
