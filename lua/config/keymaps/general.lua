local keymap = vim.keymap.set

keymap("i", "jj", "<Esc>", { desc = "Troca de volta para o normal mode quando eu estou no insert mode" })
keymap("n", "B", "^", { desc = "Pula para o começo da linha. É só o ^ remapeado" })
keymap("n", "E", "$", { desc = "Pula para o final da linha. É só o $ remapeado" })

keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Salva o meu arquivo atual" })
keymap("n", "<leader>wa", "<cmd>wa<cr> ", { desc = "Salva o meu arquivo atual" })
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })


keymap("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard" })
keymap("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
