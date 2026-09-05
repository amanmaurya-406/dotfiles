return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      padding = true, ---Add a space b/w comment and the line
      sticky = true, ---Whether the cursor should stay at its position
      ignore = nil, ---Lines to be ignored while (un)comment

      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        line = 'gcc', ---Line-comment toggle keymap
        block = 'gbb', ---Block-comment toggle keymap
      },

      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = 'gc', ---Line-comment keymap
        block = 'gb', ---Block-comment keymap
      },

      ---LHS of extra mappings
      extra = {
        above = 'gcO', ---Add comment on the line above
        below = 'gco', ---Add comment on the line below
        eol = 'gcA', ---Add comment at the end of line
      },

      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },

      ---Function to call before (un)comment
      pre_hook = nil,
      ---Function to call after (un)comment
      post_hook = nil,
    },
  },

  -- Finds/Highlight and lists all of the TODO, NOTES, HACK, BUG, etc comment
  -- in your project and loads them into a browsable list.
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    opts = {},

    keys = {
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next Todo Comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Previous Todo Comment',
      },
      { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todo (Trouble)' },
      { '<leader>xT', '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>', desc = 'Todo/Fix/Fixme (Trouble)' },
      { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
      { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo/Fix/Fixme' },
    },
  },
}
