-- Enable line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight which line your cursor is on
vim.opt.cursorline = true

-- Set tab width to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Configure how new splits should be opened
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Persistent undo (save undo history across sessions)
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'state' .. '/undo'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 1500

vim.opt.list = true
vim.opt.listchars = {
  tab = 'a ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'nosplit'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- folding options
vim.opt.foldmethod = 'indent' -- fold based on indentation
vim.opt.foldenable = true -- enable folding by default
vim.opt.foldlevel = 99 -- keep everything open unless folded manually

-- Adds a trailing newline to every file on save — it's true by default
-- vim.opt.fixendofline = false

-- hide the command-line bar entirely when not in use
vim.opt.cmdheight = 0

vim.opt.termguicolors = true
