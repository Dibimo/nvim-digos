vim.opt.termguicolors = true
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },

  config= function ()
    -- Cache para status git dos arquivos
    local git_status_cache = {}

    -- Função para atualizar cache do git status
    local function update_git_status()
      git_status_cache = {}
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then return end

      local result = vim.fn.systemlist("git status --porcelain")
      for _, line in ipairs(result) do
        if line ~= "" then
          local status = line:sub(1, 2)
          local file = line:sub(4)
          local full_path = git_root .. "/" .. file
          git_status_cache[full_path] = status
        end
      end
    end

    -- Atualizar cache inicialmente
    update_git_status()

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

        -- Formatar nome do buffer com status git
        name_formatter = function(buf)
          local bufpath = vim.api.nvim_buf_get_name(buf.bufnr)
          local git_status = git_status_cache[bufpath]
          local status_text = ""

          if git_status then
            -- Mapear status do git para indicadores
            local first_char = git_status:sub(1, 1)
            local second_char = git_status:sub(2, 2)

            if first_char == "?" and second_char == "?" then
              status_text = " [??]"  -- Untracked
            elseif first_char == "A" then
              status_text = " [A]"   -- Added
            elseif first_char == "M" or second_char == "M" then
              status_text = " [M]"   -- Modified
            elseif first_char == "D" or second_char == "D" then
              status_text = " [D]"   -- Deleted
            elseif first_char == "R" then
              status_text = " [R]"   -- Renamed
            elseif first_char == "C" then
              status_text = " [C]"   -- Copied
            elseif first_char == "U" then
              status_text = " [U]"   -- Updated but unmerged
            end
          end

          return buf.name .. status_text
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

    -- Atualizar cache do git status quando houver mudanças
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "FocusGained" }, {
      callback = function()
        update_git_status()
        vim.cmd('redrawtabline')
      end,
    })

    -- Atualizar quando gitsigns atualizar
    vim.api.nvim_create_autocmd("User", {
      pattern = "GitSignsUpdate",
      callback = function()
        update_git_status()
        vim.cmd('redrawtabline')
      end,
    })
  end
}
