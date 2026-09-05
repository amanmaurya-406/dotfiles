local M = {}

function M.setup(capabilities)
  vim.lsp.config('lua_ls', {
    capabilities = capabilities,

    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
          },

          --[[
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              vim.fn.expand '$VIMRUNTIME/lua',
              vim.fn.stdpath 'config' .. '/lua',
            },
            -- Stop the server from scanning the entire disk for files
            checkThirdParty = false,
          },
          ]]

          disable = {
            'missing-fields',
          },
        },
      },
    },
  })
end

return M
