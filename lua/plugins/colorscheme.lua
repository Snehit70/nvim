require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = false,
    custom_highlights = function(colors)
        return {
            -- Main background transparent
            Normal = { bg = colors.none },
            
            -- Line numbers with white text for visibility
            LineNr = {
                bg = colors.none,
                fg = colors.text,  -- Full white for visibility
            },
            CursorLineNr = {
                bg = colors.none,
                fg = colors.peach,  -- Keep warm accent
                bold = true,
            },
            SignColumn = { bg = colors.none },
            
            -- Bufferline - using correct highlight groups
            BufferLineBackground = {
                bg = colors.surface0,
                fg = colors.text,
            },
            BufferLineFill = {
                bg = colors.surface0,  -- This controls the empty space
            },
            BufferLineTab = {
                bg = colors.surface0,
                fg = colors.text,
            },
            BufferLineTabClose = {
                bg = colors.surface0,
                fg = colors.text,
            },
            BufferLineTabSelected = {
                bg = colors.surface1,
                fg = colors.text,
                bold = true,
            },
            BufferLineIndicatorSelected = {
                fg = colors.peach,
            },
            
            -- Nvim-tree with glass background
            NvimTreeNormal = {
                bg = colors.surface0,
                fg = colors.text,
            },
            NvimTreeWinSeparator = {
                fg = colors.surface1,
                bg = colors.none
            },
            
            -- Telescope with glass backgrounds
            TelescopeNormal = { bg = colors.surface0 },
            TelescopeBorder = {
                fg = colors.surface2,
                bg = colors.surface0
            },
            TelescopePromptNormal = { bg = colors.surface1 },
            TelescopePromptBorder = {
                fg = colors.surface2,
                bg = colors.surface1
            },
            TelescopeResultsNormal = { bg = colors.surface0 },
            TelescopePreviewNormal = { bg = colors.surface0 },
            
            -- LSP floating windows with glass effect
            NormalFloat = { bg = colors.surface0 },
            FloatBorder = {
                fg = colors.surface2,
                bg = colors.surface0
            },
            
            -- Completion menu glass effect
            Pmenu = { bg = colors.surface0, fg = colors.text },
            PmenuSel = { bg = colors.surface1, fg = colors.text, bold = true },
            PmenuBorder = { fg = colors.surface2, bg = colors.surface0 },
            
            -- Status line with glass effect - using lualine groups
            lualine_a_normal = { bg = colors.surface0 },
            lualine_b_normal = { bg = colors.surface0 },
            lualine_c_normal = { bg = colors.surface0 },
            StatusLine = { bg = colors.surface0 },
            StatusLineNC = { bg = colors.none },
            
            -- Window separators
            WinSeparator = {
                fg = colors.surface1,
                bg = colors.none
            },
            VertSplit = {
                fg = colors.surface1,
                bg = colors.none
            },
            
            -- Terminal stays transparent
            TerminalNormal = { bg = colors.none },
        }
    end,
})

vim.cmd.colorscheme("catppuccin-mocha")

-- Additional settings for better glass effect
vim.opt.pumblend = 10
vim.opt.winblend = 10
