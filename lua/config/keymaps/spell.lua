local keymap = vim.keymap.set
keymap("n", "<leader>ss", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
keymap("n", "<leader>sn", "]s", { desc = "Next spelling error" })
keymap("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
keymap("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
keymap("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })

