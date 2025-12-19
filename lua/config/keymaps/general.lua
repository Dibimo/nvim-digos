local keymap = vim.keymap.set

keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Salva o meu arquivo atual" })
keymap("n", "<leader>wa", "<cmd>wa<cr> ", { desc = "Salva o meu arquivo atual" })
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
keymap("n", "<leader>ss", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
keymap("n", "<leader>sn", "]s", { desc = "Next spelling error" })
keymap("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
keymap("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
keymap("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })


-- if vim.g.neovide then
--   print('isso é um teste para ver se entrou aqui mesmo')
--   vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
--   vim.keymap.set('v', '<D-c>', '"+y') -- Copy
--   vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
--   vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
--   vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
--   vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
-- end
--
-- -- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
--


-- Copiar para clipboard do sistema (modo visual)
keymap("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Colar da clipboard do sistema (modo normal e insert)
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard" })

-- Cortar para clipboard do sistema (modo visual)
keymap("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
