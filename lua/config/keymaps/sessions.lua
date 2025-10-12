local keymap = vim.keymap.set

keymap("n", "<leader>qs", function() require("persistence").save() end, { desc = "Save session" })
keymap("n", "<leader>ql", function() require("persistence").load() end, { desc = "Load session" })
keymap("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop persistence" })
keymap("n", "<leader>qr", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })

