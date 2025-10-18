local opt = vim.opt

-- opt.spell = true
-- opt.spelllang = { 'pt_br', 'en_us' }
opt.spellsuggest = "best,9"  -- Mostrar até 9 sugestões

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

opt.wrap = false
opt.termguicolors = true
opt.mouse = "a"

opt.timeout = true
opt.timeoutlen = 500
opt.ttimeout = true
opt.ttimeoutlen = 0

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevelstart = 2
opt.foldtext = ""


-- Remover espaços em branco a direita
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern="*",
  command="%s/\\s\\+$//e",
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
   vim.opt_local.wrap = true
   vim.opt_local.linebreak = true
   vim.opt_local.showbreak = "↪ "
  end
})
