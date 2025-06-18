require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua","python","javascript","html","css","bash","json","yaml","bash","json","yaml","markdown","vim","vimdoc"
    },
    highlight = {
        enable = true, --turn on better syntax highlighting
        additional_vim_regex_highlighting = false, --disable vim regex highlighting
    },
    indent = {
        enable = true, -- smarted indentation ( works well for most languages)
    },
    --Add this for better indentation detection
    incremental_selection = {
        enable = true, --enable incremental selection
        keymaps = {
            init_selection = "<C-s>", --start selection with Ctrl+s
            node_incremental = "<C-s>", --increment selection with Ctrl+s
            scope_incremental = "<C-a>", --increment to scope with Ctrl+a
            node_decremental = "<C-d>", --decrement selection with Ctrl+d
        },
    },
})



