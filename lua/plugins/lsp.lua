-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- Mason (Gerenciador de LSP servers)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- LSP Config (NOVA API do Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      vim.lsp.config('*', {
        capabilities = capabilities,
        root_markers = { '.git' }  -- fallback padrão
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local opts = { buffer = bufnr, silent = true }

          -- Keymaps do LSP
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          if client.supports_method('textDocument/inlayHint') then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end,
      })

      vim.lsp.config('lua_ls', {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = { '.luarc.json', '.luarc.jsonc', '.stylua.toml', '.git' },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Emmet Language Server
      vim.lsp.config('emmet_language_server', {
        cmd = { 'emmet-language-server', '--stdio' },
        filetypes = { 'html', 'css', 'javascriptreact', 'typescriptreact' },
        root_markers = { '.git', 'package.json' },
      })

      -- Python (Pyright)
      vim.lsp.config('pyright', {
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
        root_markers = {
          'pyproject.toml',
          'setup.py',
          'requirements.txt',
          '.git'
        },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            }
          }
        }
      })

      -- TypeScript/JavaScript
      vim.lsp.config('ts_ls', {
        cmd = { 'typescript-language-server', '--stdio' },
        filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact'
        },
        root_markers = {
          'tsconfig.json',
          'jsconfig.json',
          'package.json',
          '.git'
        },
      })

      -- HTML (precisa de snippet support)
      local html_capabilities = vim.deepcopy(capabilities)
      html_capabilities.textDocument.completion.completionItem.snippetSupport = true

      vim.lsp.config('html', {
        cmd = { 'vscode-html-language-server', '--stdio' },
        filetypes = { 'html' },
        root_markers = { 'package.json', '.git' },
        capabilities = html_capabilities,
        init_options = {
          provideFormatter = true,
        },
      })

      -- CSS (precisa de snippet support)
      vim.lsp.config('cssls', {
        cmd = { 'vscode-css-language-server', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
        root_markers = { 'package.json', '.git' },
        capabilities = html_capabilities,
        settings = {
          css = { validate = true },
          scss = { validate = true },
          less = { validate = true },
        },
      })

      -- JSON (precisa de snippet support)
      vim.lsp.config('jsonls', {
        cmd = { 'vscode-json-language-server', '--stdio' },
        filetypes = { 'json', 'jsonc' },
        root_markers = { 'package.json', '.git' },
        capabilities = html_capabilities,
        settings = {
          json = {
            validate = { enable = true },
            format = { enable = true },
          },
        },
      })

      -- Bash
      vim.lsp.config('bashls', {
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'sh', 'bash' },
        root_markers = { '.git' },
      })

      vim.lsp.enable({
        'lua_ls',
        'emmet_language_server',
        'pyright',
        'ts_ls',
        'html',
        'cssls',
        'jsonls',
        'bashls',
      })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
        },
      })

      -- Ícones dos diagnósticos
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = "󰌶 ",
        Info = " "
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
