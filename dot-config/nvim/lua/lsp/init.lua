local M = {}

function M.setup(capabilities)
  require('lsp.lua_ls').setup(capabilities)
  require('lsp.clangd').setup(capabilities)

  -- Enable servers
  vim.lsp.enable {
    'lua_ls',
    'clangd',
  }
end

return M
