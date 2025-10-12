local keymap = vim.keymap.set

-- Navegação entre hunks (blocos de alterações)
keymap("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next git hunk" })
keymap("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous git hunk" })

-- Ações em hunks
keymap("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
keymap("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Undo stage hunk" })
keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })

-- Ações no arquivo inteiro
keymap("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", { desc = "Stage buffer" })
keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })

-- Git blame
keymap("n", "<leader>hb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle git blame" })
keymap("n", "<leader>hB", "<cmd>Gitsigns blame_line<cr>", { desc = "Show blame line" })

-- Diff
keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>", { desc = "Diff this" })
keymap("n", "<leader>hD", "<cmd>Gitsigns diffthis ~<cr>", { desc = "Diff this ~" })
