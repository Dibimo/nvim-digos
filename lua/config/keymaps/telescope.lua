local keymap = vim.keymap.set

keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find files" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })
keymap("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find help" })

