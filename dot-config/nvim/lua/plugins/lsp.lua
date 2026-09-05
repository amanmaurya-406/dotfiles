return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',

    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        { path = 'blink.cmp' },
      },
    },
  },

  {
    'neovim/nvim-lspconfig',

    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'mason-org/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
      { 'j-hui/fidget.nvim', opts = {} },
      { 'saghen/blink.cmp' },
    },

    config = function()
      -- LSP capabilities from blink.cmp
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require('lsp').setup(capabilities)

      -- Mason tool installer
      require('mason-tool-installer').setup {
        ensure_installed = {
          'lua-language-server',
          'clangd',
          'stylua',
        },
      }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
      }

      -- LspAttach keymaps and highlights
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(lhs, rhs, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, lhs, rhs, {
              buffer = event.buf,
              desc = 'LSP: ' .. desc,
            })
          end

          map('gO', function()
            require('telescope.builtin').lsp_document_symbols()
          end, 'Open Document Symbols')
          map('gW', function()
            require('telescope.builtin').lsp_dynamic_workspace_symbols()
          end, 'Open Workspace Symbols')
          map('grd', function()
            require('telescope.builtin').lsp_definitions()
          end, '[G]oto [D]efinition')
          map('grr', function()
            require('telescope.builtin').lsp_references()
          end, '[G]oto [R]eferences')
          map('gri', function()
            require('telescope.builtin').lsp_implementations()
          end, '[G]oto [I]mplementation')
          map('grt', function()
            require('telescope.builtin').lsp_type_definitions()
          end, '[G]oto [T]ype Definition')

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor res\\\ts there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),

              callback = function(event2)
                vim.lsp.buf.clear_references()

                vim.api.nvim_clear_autocmds {
                  group = 'lsp-highlight',
                  buffer = event2.buf,
                }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>h', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {
                bufnr = event.buf,
              })
            end, 'Toggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,

        float = {
          border = 'rounded',
          source = 'if_many',
        },

        underline = {
          severity = vim.diagnostic.severity.ERROR,
        },

        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},

        virtual_text = {
          source = 'if_many',
          spacing = 2,

          format = function(diagnostic)
            return diagnostic.message
          end,
        },
      }
    end,
  },
}
