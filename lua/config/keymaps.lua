local keymap = vim.keymap.set

vim.g.mapleader = " "


keymap("n", "<leader>w", "<cmd>Neovim Write<cr>", { desc = "Salva o meu arquivo atual" })

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })

-- Neo-tree
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
keymap("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file explorer" })
keymap("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file" })
keymap("n", "<leader>fe", "<cmd>Neotree filesystem<cr>", { desc = "Filesystem explorer" })
keymap("n", "<leader>fb", "<cmd>Neotree buffers<cr>", { desc = "Buffer explorer" })
keymap("n", "<leader>fg", "<cmd>Neotree git_status<cr>", { desc = "Git status explorer" })

