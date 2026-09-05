-- Auto pairs
-- Automatically inserts a matching closing character
-- when you type an opening character like `"`, `[`, or `(`.
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',

  config = function()
    require('nvim-autopairs').setup {
      check_ts = true, -- use treesitter for smarter pairing
      fast_wrap = {},
    }
  end,
}
