return {
  {
    "github/copilot.vim",
    event = "InsertEnter",

    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true

      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["markdown"] = false,
        ["text"] = false,
        ["gitcommit"] = false,
      }

      -- ALTERNATIVA 2: Alt + Enter (mais confortável em alguns teclados)
      -- vim.keymap.set('i', '<M-CR>', 'copilot#Accept("\\<CR>")', {
      vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = "Copilot: Accept suggestion"
      })


      -- PRÓXIMA SUGESTÃO: Alt + ]
      vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)', {
        silent = true,
        desc = "Copilot: Next suggestion"
      })

      -- SUGESTÃO ANTERIOR: Alt + [
      vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)', {
        silent = true,
        desc = "Copilot: Previous suggestion"
      })

      -- DESCARTAR SUGESTÃO: Ctrl + ]
      vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)', {
        silent = true,
        desc = "Copilot: Dismiss suggestion"
      })

      -- ACEITAR PRÓXIMA PALAVRA: Alt + w
      vim.keymap.set('i', '<M-w>', 'copilot#AcceptWord()', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = "Copilot: Accept next word"
      })

      -- ACEITAR PRÓXIMA LINHA: Alt + l
      vim.keymap.set('i', '<M-l>', 'copilot#AcceptLine()', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = "Copilot: Accept next line"
      })

      -- ============================================
      -- COMANDOS EM MODO NORMAL
      -- ============================================

      -- TOGGLE COPILOT: <leader>cp
      vim.keymap.set('n', '<leader>cp', function()
        if vim.b.copilot_enabled == false then
          vim.cmd('Copilot enable')
          vim.notify('Copilot Ativado', vim.log.levels.INFO)
        else
          vim.cmd('Copilot disable')
          vim.notify('Copilot Desativado', vim.log.levels.WARN)
        end
      end, { desc = "Toggle Copilot" })

      -- ABRIR PAINEL DE SUGESTÕES: <leader>cs
      vim.keymap.set('n', '<leader>cs', '<cmd>Copilot panel<cr>', {
        desc = "Copilot: Open suggestions panel"
      })

      -- STATUS DO COPILOT: <leader>ci
      vim.keymap.set('n', '<leader>ci', '<cmd>Copilot status<cr>', {
        desc = "Copilot: Show status"
      })
    end,

  }
}
