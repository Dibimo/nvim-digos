return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- Lista os LSPs que você quer instalar automaticamente
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "bashls",
        "emmet_language_server",
        "vue_ls",
      },

      -- Habilita automaticamente os LSPs instalados
      automatic_enable = true,
    },
  },
}
