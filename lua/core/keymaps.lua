-- keymaps for my config 


--toggle nvim-tree wiht <leader> e
vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>",{ desc = "Toggle File explorer"})

--toggle terminal horizontally with <leader>tt
vim.keymap.set("n","<leader>tt","<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })

--toggle terminal as floating window with <leader>tf
vim.keymap.set("n","<leader>tf","<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

--toggle terminal vetically with <leader>tv
vim.keymap.set("n","<leader>tv","<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle  vertical terminal" })


