return {
  {
    "olimorris/persisted.nvim",
    lazy = false,
    priority = 100,
    keys = {
      { "<leader>ss", "<cmd>SessionSave<CR>", desc = "Salvar sessão" },
      { "<leader>sl", "<cmd>SessionLoad<CR>", desc = "Carregar sessão" },
      { "<leader>sf", "<cmd>Telescope persisted<CR>", desc = "Buscar sessões" },
      { "<leader>sd", "<cmd>SessionDelete<CR>", desc = "Deletar sessão" },
    },
    opts = {
      autostart = true,
      autoload = true,
      use_git_branch = true,
      follow_cwd = true,
      allowed_dirs = { "~/code", "~/projects" },
      ignored_dirs = { "~/.config", { "/", exact = true } },
      should_save = function()
        return not vim.tbl_contains({ "alpha", "dashboard", "lazy" }, vim.bo.filetype)
      end,
      on_autoload_no_session = function()
        vim.notify("Nova sessão iniciada", vim.log.levels.INFO)
      end,
    },
    config = function(_, opts)
      local persisted = require("persisted")

      -- Fix detecção de branch em subdiretórios
      persisted.branch = function()
        local branch = vim.fn.systemlist("git branch --show-current")[1]
        return vim.v.shell_error == 0 and branch or nil
      end

      persisted.setup(opts)
      require("telescope").load_extension("persisted")

      -- Limpar buffers de plugins antes de salvar
      vim.api.nvim_create_autocmd("User", {
        pattern = "PersistedSavePre",
        callback = function()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.tbl_contains({ "NvimTree", "neo-tree", "Trouble" }, vim.bo[buf].filetype) then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end,
      })
    end,
  }}
