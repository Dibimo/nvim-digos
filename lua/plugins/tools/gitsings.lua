return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        -- Símbolos na lateral (sign column)
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },

        -- Mostrar blame inline (autor da linha)
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
        },

        -- Preview de hunks (blocos de alterações)
        preview_config = {
          border = 'rounded',
          style = 'minimal',
        },

        -- Atualização em tempo real
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },

        -- Outras opções
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
      })
    end,
  },
}
