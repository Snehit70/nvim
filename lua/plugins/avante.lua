-- Avante.nvim configuration
require("avante").setup({
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    behaviour = {
        auto_suggestions = false,
        auto_set_keymaps = false,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        focus = "<leader>af",
        toggle = "<leader>at",
        sidebar = {
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },
    windows = {
        position = "right",
        width = 30,
        sidebar_header = {
            enabled = true,
            align = "center",
            rounded = true,
        },
    },
})


