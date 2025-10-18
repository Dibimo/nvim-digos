return {
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      -- cfg options
    },
    config = function()
      require("lsp_signature").setup({
        -- Habilita no modo Insert (ao digitar)
        bind = true,
        floating_window = true,
        always_trigger = true,

        -- Triggers para modo Insert
        trigger_on_newline = true,
        extra_trigger_chars = { "(", ",", "=" },

        -- Configurações da janela flutuante
        handler_opts = {
          border = "rounded",
          focusable = false,
          relative = "cursor",
        },

        -- Habilita hints inline também
        hint_enable = true,
        hint_prefix = "🔍 ",
        hint_inline = function() return false end, -- ou true se quiser inline

        -- Timer para debounce
        timer_interval = 200,

        -- Habilita para modo Normal também
        floating_window_above_cur_line = true,
        check_cursor_word = true,
      })

      -- Keybinding adicional para toggle manual no modo Normal
      vim.keymap.set("n", "gs", function()
        require("lsp_signature").toggle_float_win()
      end, { desc = "Toggle signature help" })

      -- Alternativa com vim.lsp.buf
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
    end,

  }
}
