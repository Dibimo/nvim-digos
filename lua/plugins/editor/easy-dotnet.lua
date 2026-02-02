return {
  -- lazy.nvim
  { "nvim-neotest/nvim-nio", lazy = false },
  {
    "mfussenegger/nvim-dap",
    lazy = false,  -- <-- ADICIONAR ESTA LINHA
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,  -- <-- ADICIONAR ESTA LINHA
    -- ...
  },
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
    config = function()
      require("easy-dotnet").setup()
    end
  }
}
