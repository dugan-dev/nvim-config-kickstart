return {
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
      vim.cmd.colorscheme 'retro-theme'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
