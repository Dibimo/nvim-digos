vim.opt.termguicolors = true
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },

  config= function ()
    require("bufferline").setup({
      options = {
        -- Modo de exibição
        mode = "buffers", -- "buffers" | "tabs"

        -- Números nas abas
        numbers = "none", -- "none" | "ordinal" | "buffer_id" | "both"

        -- Ícones do diagnostics (LSP)
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        -- Separadores
        separator_style = "thick", -- "slant" | "thick" | "thin" | "padded_slant"

        -- Mostrar ícones
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,

        -- Buffers especiais
        show_duplicate_prefix = true,
        persist_buffer_sort = true,

        -- Comportamento
        always_show_bufferline = true,
        sort_by = 'id',

        -- INTEGRAÇÃO COM GITSIGNS
        -- Exibir indicadores de modificações do Git
        custom_areas = {
          right = function()
            local result = {}

            -- Pega informações do gitsigns do buffer atual
            local gitsigns = vim.b.gitsigns_status_dict

            if gitsigns then
              if gitsigns.added and gitsigns.added > 0 then
                table.insert(result, { text = "  +" .. gitsigns.added, link = "BufferlineGitAdd" })
              end
              if gitsigns.changed and gitsigns.changed > 0 then
                table.insert(result, { text = "  ~" .. gitsigns.changed, fg = "#fab387" })
              end
              if gitsigns.removed and gitsigns.removed > 0 then
                table.insert(result, { text = "  -" .. gitsigns.removed, fg = "#f38ba8" })
              end

              -- Nome do branch
              if gitsigns.head and gitsigns.head ~= "" then
                table.insert(result, { text = "   " .. gitsigns.head .. " ", fg = "#89b4fa" })
              end
            end

            return result
          end,
        },

        -- Offset para explorador de arquivos
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
      },

      -- Highlight groups customizados
      highlights = {
        -- Buffer modificado (não salvo)
        buffer_selected = {
          bold = true,
          italic = false,
        },

        -- Adicionar destaque para arquivos modificados do Git
        modified = {
          fg = '#f99157', -- Laranja para arquivos modificados
        },
        modified_selected = {
          fg = '#f99157',
        },
        modified_visible = {
          fg = '#f99157',
        },
      },
    })
  end
}
