--lazy vim stats here

--Bootstrap lazy.nvim if it isn't installed
--lazy nvim is a plugin manager that manages the plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


--lets load plugins first lets add  a color scheme
require("lazy").setup({
    --catpuccin colorscheme
    {"catppuccin/nvim", name= "catppuccin"},
    --file explorer plugin tree
    {"nvim-tree/nvim-tree.lua"},
    --telescope fuzzy finder 
    {"nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim"}
    },
    -- this adds more precise syntax highlighting 
    {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
    },
    -- thsi does the status line thing
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons"}, --optional
    },

    --lsp support
    {"neovim/nvim-lspconfig"},--talks to lsp servers
    {"williamboman/mason.nvim"},-- ui installer for lsps and tools
    {"williamboman/mason-lspconfig.nvim"}, --bridge gap btw both

    --auto complete
    {"hrsh7th/nvim-cmp"}, --the completion engine
    {"hrsh7th/cmp-nvim-lsp"}, --allow lsp results as suggestions

    --snippet engine
    {"L3MON4D3/LUASnip"},  --snippet engine
    {"saadparwaiz1/cmp_luasnip" }, -- lua snip to integrate nvim-cmp

    --git indicators in sign column
    {"lewis6991/gitsigns.nvim"},

    --keybinding helper
    {"folke/which-key.nvim" },

    --terminal 
    { "akinsho/toggleterm.nvim",version="*",config = true },



})


