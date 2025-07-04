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
    -- tokyo night colorscheme
    {"folke/tokyonight.nvim",lazy = false, priority = 1000},
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
    -- this does the status line thing
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
    {"L3MON4D3/LUASnip", event = "InsertEnter"},  --snippet engine
    {"saadparwaiz1/cmp_luasnip", event = "InsertEnter"}, -- lua snip to integrate nvim-cmp

    --git indicators in sign column
    {"lewis6991/gitsigns.nvim", event = "BufReadPre"},

    --keybinding helper
    {"folke/which-key.nvim" },

    --terminal 
    { "akinsho/toggleterm.nvim",version="*",config = true },
    
    --markdown preview
    {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install ",
    config = function()
        vim.g.mkdp_auto_start = 0
    end,
    },

    --json schema support
    {"b0o/schemastore.nvim"},

    --buffer management with visual tabs
    {"akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons" },

    --window management for moving windows around
    {"sindrets/winshift.nvim" },

    --additional completion sources
    {"hrsh7th/cmp-buffer"}, -- complete from text in current buffer
    {"hrsh7th/cmp-path" }, -- complete file paths
    {"hrsh7th/cmp-cmdline"}, -- complte neovim commands
    
    --Github copilot support
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function ()
            require("copilot").setup({})
        end,
    }, 
     --copilot chat interface
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        cmd = { "CopilotChat", "CopilotChatExplain", "CopilotChatReview", "CopilotChatFix", "CopilotChatOptimize" },
        dependencies = {
            {"zbirenbaum/copilot.lua" },
            {"nvim-lua/plenary.nvim" },
        },
    }, 
    --copilot completion source for nvim-cmp
    {
        "zbirenbaum/copilot-cmp",
        dependencies = {"zbirenbaum/copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end,
    },

    --Visual indentation guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "|",
                tab_char ="|",
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = false,
                injected_languages =false,
                highlight = {"Function","Label" },
                priority = 500,
            },
        },
    },
    --autopairs for brackets and quotes
    {"windwp/nvim-autopairs",
        event ="InsertEnter",
    },

    --auto close and rename html/jsx tags
    {
        "windwp/nvim-ts-autotag",
        ft = {"html", "javascript", "javascriptreact", "typescriptreact",
        "vue", "svelte", "astro", "markdown","tsx","jsx" },
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            "zbirenbaum/copilot.lua",
            "HakonHarnes/img-clip.nvim",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                ft = { "markdown", "Avante" },
            },
        },
    },
    --html enhancers
    {"mattn/emmet-vim"}, -- Essential for HTML/CSS - provides tag expansion
    {"AndrewRadev/tagalong.vim"}, -- Automatically rename closing HTML tags
    {"alvan/vim-closetag"}, -- Auto-close HTML tags
    {"hail2u/vim-css3-syntax"}, -- Enhanced CSS3 syntax
    {"ap/vim-css-color"}, -- Preview CSS colors inline
    
    -- Enhanced git integration
    {"tpope/vim-fugitive"}, -- Git commands in Neovim
})




