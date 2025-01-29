return {
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- Ensures the colorscheme loads first
    config = function()
      require('onedark').setup {
        style = 'darker', -- Options: dark, darker, cool, deep, warm, warmer
        transparent = true,
      }
      require('onedark').load()
    end,
  },
  {
    'mistweaverco/retro-theme.nvim',
    priority = 1000,
    opts = {
      italic_comments = true,
      disable_cache = false,
      hot_reload = false,
    },
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
  },
  {
    'LazyVim/LazyVim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
