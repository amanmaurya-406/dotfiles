return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    preset = 'helix',

    filter = function(mapping)
      return mapping.desc and mapping.desc ~= ''
    end,

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
      { '<leader>-', desc = 'Horizontal split (below)' },
      { '<leader>|', desc = 'Vertical split (right)' },
      { '<leader>h', desc = 'Toggle Inlay [H]ints' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>b', group = '[B]uffer' },
      { '[', group = 'prev' },
      { ']', group = 'next' },
      { 'g', group = 'goto' },
      { 'z', group = 'fold' },

      -- Screen position
      { 'z<CR>', desc = 'Top this line' },
      { 'zt', desc = 'Top this line' },
      { 'zz', desc = 'Center this line' },
      { 'zb', desc = 'Bottom this line' },
      { 'ze', desc = 'Right this line' },
      { 'zs', desc = 'Left this line' },
      { 'zH', desc = 'Half screen to theleft' },
      { 'zL', desc = 'Half screen to the right' },
      { 'zv', desc = 'Show cursor line' },

      -- Fold: open
      { 'zo', desc = 'Open fold under cursor' },
      { 'zO', desc = 'Open all fold under cursor' },
      { 'zR', desc = 'Open all folds' },

      -- Fold: close
      { 'zc', desc = 'Close fold under cursor' },
      { 'zC', desc = 'Close all fold under cursor' },
      { 'zM', desc = 'Close all folds' },

      -- Fold: toggle
      { 'za', desc = 'Toggle fold under cursor' },
      { 'zA', desc = 'Toggle all fold under cursor' },
      { 'zi', desc = 'Toggle folding' },

      -- Fold: create/delete/adjust
      { 'zf', desc = 'Create' },
      { 'zd', desc = 'Delete under cursor' },
      { 'zD', desc = 'Delete all under cursor' },
      { 'zE', desc = 'Delete all in file' },
      { 'zm', desc = 'Fold more' },
      { 'zr', desc = 'Fold less' },
      { 'zx', desc = 'Update folds' },

      -- Spelling
      { 'z=', desc = 'Suggestions' },
      { 'zg', desc = 'Add word to list' },
      { 'zw', desc = 'Mark as misspelling' },
    },

    sort = { 'group', 'manual' },
  },
}
