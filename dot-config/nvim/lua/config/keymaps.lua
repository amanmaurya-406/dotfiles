vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', 'q:', '<Nop>', { noremap = true })

-- Do things without affecting the registers
vim.keymap.set('n', '<leader>p', '"0p')
vim.keymap.set('n', '<leader>P', '"0P')
vim.keymap.set('x', '<leader>p', '"0p')
vim.keymap.set('n', '<leader>c', '"_c')
vim.keymap.set('n', '<leader>C', '"_C')
vim.keymap.set('x', '<leader>c', '"_c')
vim.keymap.set('x', '<leader>C', '"_C')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>D', '"_D')
vim.keymap.set('x', '<leader>d', '"_d')
vim.keymap.set('x', '<Leader>D', '"_D')

-- Paste and adjust the indent to the current line
-- vim.keymap.set('n', 'p', ']p')
-- vim.keymap.set('n', 'P', ']P')

-- Select all
-- vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Better indenting
vim.keymap.set('x', '<', '<gv')
vim.keymap.set('x', '>', '>gv')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- Split windows
vim.keymap.set('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
vim.keymap.set('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })

-- Move focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Move window
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
-- vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
-- vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
-- vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Move lines and stay selected and properly indented.
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move line up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move selection up' })

-- vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Makes the file e[X]ecutable' })

-- Incremental rename
-- vim.keymap.set('n', '<leader>rn', function()
--   return ':IncRename ' .. vim.fn.expand '<cword>'
-- end, { expr = true, desc = 'Incremental [R]e[N]ame' })

-- Open manpage for the word under cursor
vim.keymap.set('n', '<leader>m', function()
  vim.cmd('vertical Man ' .. vim.fn.expand '<cword>')
end, { desc = 'Open man page for word under cursor' })

-- lazy
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Buffers
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { desc = 'Next Buffer', silent = true })
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { desc = 'Prev Buffer', silent = true })
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete Buffer' })

vim.keymap.set('n', '<leader>bh', function()
  local current = vim.fn.bufnr '%'
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  for _, buf in ipairs(buffers) do
    if buf.bufnr < current then
      vim.cmd('bdelete ' .. buf.bufnr)
    end
  end
end, { desc = 'Delete Buffers to the Left' })

vim.keymap.set('n', '<leader>bl', function()
  local current = vim.fn.bufnr '%'
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  for _, buf in ipairs(buffers) do
    if buf.bufnr > current then
      vim.cmd('bdelete ' .. buf.bufnr)
    end
  end
end, { desc = 'Delete Buffers to the Right' })

-- j/k move by wrapped lines unless a count is given
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true })
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true })
