local M = {}

function M.setup(capabilities)
  vim.lsp.config('clangd', {
    capabilities = vim.tbl_deep_extend('force', capabilities, {
      general = {
        positionEncodings = {
          'utf-16',
        },
      },
    }),

    cmd = {
      'clangd',
      '--query-driver=/usr/bin/gcc,/usr/bin/clang',
      '--clang-tidy',
    },

    init_options = {
      clangdFileStatus = true,
    },
  })
end

return M
