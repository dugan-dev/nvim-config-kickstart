return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  opts = {},
  config = function()
    -- Set up keymaps
    vim.keymap.set('n', '<leader>tso', '<cmd>TSToolsOrganizeImports<CR>', { desc = 'TS Tools Organize Imports' })
    vim.keymap.set('n', '<leader>tss', '<cmd>TSToolsSortImports<CR>', { desc = 'TS Tools Sort Imports' })
    vim.keymap.set('n', '<leader>tsru', '<cmd>TSToolsRemoveUnusedImports<CR>', { desc = 'TS Tools Remove Unused Imports' })
    vim.keymap.set('n', '<leader>tsra', '<cmd>TSToolsRemoveUnused<CR>', { desc = 'TS Tools Remove Unused' })
    vim.keymap.set('n', '<leader>tsa', '<cmd>TSToolsAddMissingImports<CR>', { desc = 'TS Tools Add Missing Imports' })
    vim.keymap.set('n', '<leader>tsfa', '<cmd>TSToolsFixAll<CR>', { desc = 'TS Tools Fix All' })
    vim.keymap.set('n', '<leader>tsD', '<cmd>TSToolsGoToSourceDefinition<CR>', { desc = 'TS Tools Go To Source Definition' })
    vim.keymap.set('n', '<leader>tsrf', '<cmd>TSToolsRenameFile<CR>', { desc = 'TS Tools Rename File' })
    vim.keymap.set('n', '<leader>tsfr', '<cmd>TSToolsFileReferences<CR>', { desc = 'TS Tools File References' })
    local api = require 'typescript-tools.api'

    require('typescript-tools').setup {
      -- Point to tsserver from vscode-langservers-extracted
      tsserver_path = '/opt/homebrew/Cellar/vscode-langservers-extracted/4.10.0/libexec/lib/node_modules/vscode-langservers-extracted/node_modules/typescript/bin/tsserver',
      handlers = {
        ['textDocument/publishDiagnostics'] = api.filter_diagnostics {
          -- Diagnostic code to ignore
          71007,
        },
      },
      settings = {
        -- Allow other LSP servers (like Tailwind) to also attach
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
      }
    }
  end,
}
