return {
  -- Adicione ao seu lua/plugins/init.lua
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background", -- renderiza cor como fundo
        enable_named_colors = true, -- cores como 'red', 'blue'
        enable_tailwind = true, -- suporte ao Tailwind

        -- Tipos de arquivo suportados
        filetypes = {
          "css",
          "scss",
          "html",
          "javascript",
          "typescript",
          "lua",
          "vim",
          "tsx",
          "jsx",
          "vue"
        },

        -- Excluir arquivos específicos
        exclude_filetypes = {},
        exclude_buftypes = {}
      })
    end,
  }
}
