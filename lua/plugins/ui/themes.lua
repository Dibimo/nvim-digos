return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "shaunsingh/nord.nvim",
    options = {
      theme = 'nord'
    }

  },
  { "EdenEast/nightfox.nvim" },
  {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme visual_studio_code]])
    end,
  },
  { "savq/melange-nvim" }
}

