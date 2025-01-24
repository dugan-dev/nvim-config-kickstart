return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    keys = {
      { '<leader>tso', '<cmd>TSToolsOrganizeImports<CR>', desc = 'TS Tools Organize Imports' },
      { '<leader>tss', '<cmd>TSToolsSortImports<CR>', desc = 'TS Tools Sort Imports' },
      { '<leader>tsru', '<cmd>TSToolsRemoveUnusedImports<CR>', desc = 'TS Tools Remove Unused Imports' },
      { '<leader>tsra', '<cmd>TSToolsRemoveUnused<CR>', desc = 'TS Tools Remove Unused' },
      { '<leader>tsa', '<cmd>TSToolsAddMissingImports<CR>', desc = 'TS Tools Add Missing Imports' },
      { '<leader>tsfa', '<cmd>TSToolsFixAll<CR>', desc = 'TS Tools Fix All' },
      { '<leader>tsD', '<cmd>TSToolsGoToSourceDefinition<CR>', desc = 'TS Tools Go To Source Definition' },
      { '<leader>tsrf', '<cmd>TSToolsRenameFile<CR>', desc = 'TS Tools Rename File' },
      { '<leader>tsfr', '<cmd>TSToolsFileReferences<CR>', desc = 'TS Tools File References' },
    },
    config = function()
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
  },
}
