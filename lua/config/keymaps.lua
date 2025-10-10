local keymap = vim.keymap.set

vim.g.mapleader = " "


keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Salva o meu arquivo atual" })
keymap("n", "<leader>wa", "<cmd>wa<cr> ", { desc = "Salva o meu arquivo atual" })

keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Find files" })
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find word" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help" })

-- Neo-tree
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle file explorer" })
keymap("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus file explorer" })
keymap("n", "<leader>E", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file" })
keymap("n", "<leader>fe", "<cmd>Neotree filesystem<cr>", { desc = "Filesystem explorer" })
--keymap("n", "<leader>fb", "<cmd>Neotree buffers<cr>", { desc = "Buffer explorer" })
keymap("n", "<leader>fg", "<cmd>Neotree git_status<cr>", { desc = "Git status explorer" })


-- Navegação entre buffers
keymap("n", "[b", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap("n", "]b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Navegação entre janelas
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Sessions
keymap("n", "<leader>qs", function() require("persistence").save() end, { desc = "Save session" })
keymap("n", "<leader>ql", function() require("persistence").load() end, { desc = "Load session" })
keymap("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop persistence" })
keymap("n", "<leader>qr", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })



keymap("n", "<leader>ss", "<cmd>set spell!<cr>", { desc = "Toggle spell check" })
keymap("n", "<leader>sn", "]s", { desc = "Next spelling error" })
keymap("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
keymap("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
keymap("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })
