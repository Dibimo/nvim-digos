local keymap = vim.keymap.set

keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Salva o meu arquivo atual" })
keymap("n", "<leader>wa", "<cmd>wa<cr> ", { desc = "Salva o meu arquivo atual" })
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
keymap("n", "<leader>ss", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
keymap("n", "<leader>sn", "]s", { desc = "Next spelling error" })
keymap("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
keymap("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
keymap("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })



-- Copiar para clipboard do sistema (modo visual)
keymap("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Colar da clipboard do sistema (modo normal e insert)
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard" })

-- Cortar para clipboard do sistema (modo visual)
keymap("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
