local keymap = vim.keymap.set

keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
keymap("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file explorer" })
keymap("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file" })
keymap("n", "<leader>fe", "<cmd>Neotree filesystem<cr>", { desc = "Filesystem explorer" })
keymap("n", "<leader>fg", "<cmd>Neotree git_status<cr>", { desc = "Git status explorer" })

