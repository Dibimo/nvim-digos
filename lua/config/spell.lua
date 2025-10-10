
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "markdown",
    "text",
    "gitcommit",
    "tex",
    "html",
  },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { 'pt_br', 'en_us' }
    vim.opt_local.spellsuggest = "best,9"
  end
})

