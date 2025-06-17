-- keymaps for my config 


--toggle nvim-tree wiht <leader> e
vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>",{ desc = "Toggle File explorer"})

--toggle terminal horizontally with <leader>tt
vim.keymap.set("n","<leader>tt","<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })

--toggle terminal as floating window with <leader>tf
vim.keymap.set("n","<leader>tf","<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

--toggle terminal vetically with <leader>tv
vim.keymap.set("n","<leader>tv","<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle  vertical terminal" })

--make <ESC> work lik ctrl-\ ctrl-n in terminal mode
vim.keymap.set("t","<Esc>", [[<C-\><C-n>]], {desc = "Exit terminal mode"})


--keymap for markdown preview
vim.keymap.set("n","<leader>mp","<cmd>MarkdownPreviewToggle<CR>", {desc = "Toggle Markdown Preview" })


--buffer navigation keymaps
vim.keymap.set("n","<Leader>bn",":BufferLineCycleNext<CR>", { desc ="Next buffer"})
vim.keymap.set("n","<Leader>bp",":BufferLineCyclePrev<CR>", { desc =" Previous buffer"})
vim.keymap.set("n","<Leader>bc",":bdelete<CR>", { desc ="Close buffer"})

--window manangement keymaps
vim.keymap.set("n","<leader>wm", ":WinShift<CR>", {desc ="Enter window move mode "})

