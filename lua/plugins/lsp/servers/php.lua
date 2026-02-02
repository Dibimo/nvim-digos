vim.lsp.config('phpactor', {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_markers = {
    'composer.json',
    '.git',
    '.phpactor.json',
    '.phpactor.yml'
  },
  settings = {
    phpactor = {
      -- Habilita inlay hints
      inlayHints = {
        enable = true,
      },
      -- Configurações de diagnóstico
      diagnostics = {
        enable = true,
      },
    },
  },
})
