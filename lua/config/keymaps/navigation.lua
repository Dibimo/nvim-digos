local keymap = vim.keymap.set

keymap("n", "[b", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "]b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

