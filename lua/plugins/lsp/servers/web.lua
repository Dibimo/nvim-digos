local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Emmet Language Server
vim.lsp.config('emmet_language_server', {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = {
    'html',
    'css',
    'javascriptreact',
    'typescriptreact',
    'vue'
  },
  root_markers = { '.git', 'package.json' },
})

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



