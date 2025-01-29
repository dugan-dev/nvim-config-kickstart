return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
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
      handlers = {
        ['textDocument/publishDiagnostics'] = api.filter_diagnostics {
          -- Diagnostic code to ignore
          71007,
        },
      },
    }
  end,
}
