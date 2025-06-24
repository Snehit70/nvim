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



--copilot chat keymaps
vim.keymap.set("n","<leader>cc", "<cmd>CopilotChat<CR>", {desc ="Open Copilot Chat"})
vim.keymap.set("v","<leader>ce", "<cmd>CopilotChatExplain<CR>", {desc ="Explain selected code"})
vim.keymap.set("v","<leader>cr", "<cmd>CopilotChatReview<CR>", {desc ="Review selected code"})
vim.keymap.set("v","<leader>cf", "<cmd>CopilotChatFix<CR>", {desc ="Fix selected code"})
vim.keymap.set("v","<leader>co", "<cmd>CopilotChatOptimize<CR>", {desc ="Optimized selected code"})
--vim.keymaps.set("n","<leader>cm","<cmd>CopilotChatModels<CR>",{desc = "Switch Copilot Chat Model"})


-- Avante keymaps
vim.keymap.set("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "avante: ask" })
vim.keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", { desc = "avante: edit" })
vim.keymap.set("n", "<leader>ar", ":AvanteRefresh<CR>", { desc = "avante: refresh" })
vim.keymap.set("n", "<leader>af", ":AvanteFocus<CR>", { desc = "avante: focus" })
vim.keymap.set("n", "<leader>at", ":AvanteToggle<CR>", { desc = "avante: toggle" })
vim.keymap.set("n", "<leader>a?", ":AvanteModels<CR>", { desc = "avante: select model" })
vim.keymap.set("n", "<leader>aS", ":AvanteStop<CR>", { desc = "avante: stop" })
vim.keymap.set("n", "<leader>ah", ":AvanteHistory<CR>", { desc = "avante: history" })
vim.keymap.set("n", "<leader>aB", ":AvanteBuild<CR>", { desc = "avante: add all buffers" })

-- Diffs
vim.keymap.set("n", "co", function() require("avante.diff").choose("ours") end, { desc = "avante: choose ours" })
vim.keymap.set("n", "ct", function() require("avante.diff").choose("theirs") end, { desc = "avante: choose theirs" })
vim.keymap.set("n", "ca", function() require("avante.diff").choose_all("theirs") end, { desc = "avante: choose all theirs" })
vim.keymap.set("n", "c0", function() require("avante.diff").choose("none") end, { desc = "avante: choose none" })
vim.keymap.set("n", "cb", function() require("avante.diff").choose_both() end, { desc = "avante: choose both" })
vim.keymap.set("n", "cc", function() require("avante.diff").choose_cursor() end, { desc = "avante: choose cursor" })
vim.keymap.set("n", "]x", function() require("avante.diff").next_conflict() end, { desc = "avante: next conflict" })
vim.keymap.set("n", "[x", function() require("avante.diff").prev_conflict() end, { desc = "avante: prev conflict" })

-- Codeblocks
vim.keymap.set("n", "[[", function() require("avante.codeblocks").jump("prev") end, { desc = "avante: prev codeblock" })
vim.keymap.set("n", "]]", function() require("avante.codeblocks").jump("next") end, { desc = "avante: next codeblock" })

