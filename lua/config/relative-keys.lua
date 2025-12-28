local keymap = vim.keymap.set

require("custom.relative-keys").enable()

keymap("n", "<leader>tk", function()
  require("custom.relative-keys").toggle()
end, { desc = "Toggle relative numbers with keys" })

keymap("n", "<leader>tK", function()
  require("custom.relative-keys").enable()
end, { desc = "Enable relative numbers with keys" })
