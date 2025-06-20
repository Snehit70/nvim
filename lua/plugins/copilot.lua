-- Copilot configuration
require("copilot").setup({
    panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
        },
    },

    suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
            accept= "<M-l>",         --Alt +l 
            accept_word = "<M-w>",   --Alt +w
            accept_line = "<M-j>",   --Alt +j
            next = "<M-]>",          --Alt +]
            prev = "<M-[>",          --Alt +[
            dismiss = "<C-]",        --Ctrl+]
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = 'node',
    server_opts_overrides = {},
})

--function to toggle copilot suggestions
local copilot_enabled = true
function ToggleCopilot()
    if copilot_enabled then
        vim.cmd("Copilot disable")
        copilot_enabled = false
        print("Copilot disabled")
    else
        vim.cmd("Copilot enable")
        copilot_enabled = true
        print("Copilot enabled")
    end
end
--keymap to toggle copilot
vim.keymap.set("n","<leader>ct",ToggleCopilot,{ desc = "Toggle Copilot suggestions"})

