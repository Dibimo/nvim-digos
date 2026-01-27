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
  pattern = "cs",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
   vim.opt_local.wrap = true
   vim.opt_local.linebreak = true
   vim.opt_local.showbreak = "↪ "
  end
})

opt.clipboard = "unnamedplus"

-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.neovide_opacity_point or 0.8))
end
-- Set transparency and background color (title bar color)
-- vim.g.neovide_opacity = 0.88
-- vim.g.transparency = 0.70

-- local change_transparency = function(delta)
--   vim.g.neovide_opacity_point = vim.g.neovide_opacity_point + delta
--   vim.g.neovide_background_color = "#0f1117" .. alpha()
-- end

--
--
-- vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
--   change_transparency(0.01)
-- end)
-- vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
--   change_transparency(-0.01)
-- end)


