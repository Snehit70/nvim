-- keymaps for my config 


--toggle nvim-tree wiht <leader> e
vim.keymap.set("n","<leader>e",":NvimTreeToggle<CR>",{ desc = "Toggle File explorer"})

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



-- Git history and file exploration
vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline<CR>", {desc = "Git log"})
vim.keymap.set("n", "<leader>gf", "<cmd>Git log --oneline -- %<CR>", {desc = "Git log for current file"})
vim.keymap.set("n", "<leader>gh", "<cmd>0Gclog<CR>", {desc = "Git history for current file"})



-- Enhanced terminal keymaps (replace your existing ones)
vim.keymap.set("n", "<leader>tt", "<cmd>lua toggle_horizontal_terminal()<CR>", { desc = "Toggle horizontal terminal" })
vim.keymap.set("n", "<leader>tv", "<cmd>lua toggle_vertical_terminal()<CR>", { desc = "Toggle vertical terminal" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua toggle_float_terminal()<CR>", { desc = "Toggle floating terminal" })

-- Focus terminal (like Avante's focus feature)
vim.keymap.set("n", "<leader>tF", "<cmd>lua focus_terminal()<CR>", { desc = "Focus terminal" })

-- Send current line to terminal
vim.keymap.set("n", "<leader>ts", function()
    local line = vim.api.nvim_get_current_line()
    send_to_terminal(line .. "\n")
end, { desc = "Send current line to terminal" })

-- Send selected text to terminal
vim.keymap.set("v", "<leader>ts", function()
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")
    local lines = vim.fn.getline(start_pos[2], end_pos[2])
    local text = table.concat(lines, "\n")
    send_to_terminal(text .. "\n")
end, { desc = "Send selection to terminal" })

-- Quick terminal commands
vim.keymap.set("n", "<leader>tc", function()
    send_to_terminal("clear\n")
end, { desc = "Clear terminal" })
