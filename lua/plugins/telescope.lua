require("telescope").setup({})



local builtin = require("telescope.builtin")

-- space ff: find files
vim.keymap.set("n","<leader>ff",builtin.find_files, { desc = "Find Files"})

-- space fg :Live Grep
vim.keymap.set("n","<leader>fg",builtin.live_grep, {desc = "Live Grep"})

-- space fb : List Buffers
vim.keymap.set("n","<leader>fb",builtin.buffers, {desc = " List Buffers"})

-- space fh : Help Tags
vim.keymap.set("n","<leader>fh", builtin.help_tags, {desc = "Find Help Tags"})


