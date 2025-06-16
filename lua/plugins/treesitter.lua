require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua","python","javascript","html","css","bash","json","yaml"
    },
    highlight = {
        enable = true, --turn on better syntax highlighting
    },
    indent = {
        enable = true, -- smarted indentation ( works well for most languages)
    }
})



