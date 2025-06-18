require("nvim-tree").setup({
    view = {
        side = "left",
        preserve_window_proportions = true,
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = {
            enable = true,
        },
    },
})
