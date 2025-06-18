require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- Enable this for better transparency
    show_end_of_buffer = false,
    term_colors = false, -- Keep false to avoid terminal color conflicts
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = function(colors)
        return {
            -- Core transparency - remove blend values that cause issues
            Normal = { bg = colors.none },
            NormalFloat = { bg = colors.surface0 },
            
            -- Fixed bufferline highlights to prevent background issues
            BufferLineFill = { bg = colors.none }, -- Transparent fill
            BufferLineBackground = { fg = colors.text, bg = colors.surface0 },
            BufferLineTab = { fg = colors.text, bg = colors.surface0 },
            BufferLineTabClose = { fg = colors.maroon, bg = colors.surface0 },
            BufferLineTabSelected = { fg = colors.text, bg = colors.surface1, bold = true },
            BufferLineIndicatorSelected = { fg = colors.peach, bg = colors.surface1 },
            BufferLineCloseButton = { fg = colors.surface2, bg = colors.surface0 },
            BufferLineCloseButtonSelected = { fg = colors.maroon, bg = colors.surface1 },
            BufferLineCloseButtonVisible = { fg = colors.surface2, bg = colors.surface0 },
            BufferLineSeparator = { fg = colors.surface0, bg = colors.none },
            BufferLineSeparatorSelected = { fg = colors.surface1, bg = colors.none },
            BufferLineSeparatorVisible = { fg = colors.surface0, bg = colors.none },
            
            -- Sidebar backgrounds (glass effect) - remove problematic blend
            NvimTreeNormal = { fg = colors.text, bg = colors.surface0 },
            NvimTreeWinSeparator = { fg = colors.surface1, bg = colors.none },
            NvimTreeEndOfBuffer = { bg = colors.none },
            -- Add these lines to your existing custom_highlights
            NvimTreeNormalNC = { bg = colors.none },
            NvimTreeVertSplit = { fg = colors.surface1, bg = colors.none },
            NvimTreeStatusLine = { bg = colors.none },
            NvimTreeStatusLineNC = { bg = colors.none },
            
            -- Telescope glass effect - simplified without blend
            TelescopeNormal = { bg = colors.surface0 },
            TelescopeBorder = { fg = colors.surface2, bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface1 },
            TelescopePromptBorder = { fg = colors.surface2, bg = colors.surface1 },
            TelescopeResultsNormal = { bg = colors.surface0 },
            TelescopePreviewNormal = { bg = colors.surface0 },
            TelescopeSelection = { bg = colors.surface1, fg = colors.text },
            
            -- Completion menus - fixed for better visibility
            Pmenu = { fg = colors.overlay2, bg = colors.surface0 },
            PmenuBorder = { fg = colors.surface1, bg = colors.surface0 },
            PmenuSel = { bg = colors.surface2, fg = colors.text, bold = true },
            CmpItemAbbr = { fg = colors.overlay2 },
            CmpItemAbbrMatch = { fg = colors.blue, bold = true },
            CmpItemAbbrMatchFuzzy = { fg = colors.blue, bold = true },
            CmpItemKind = { fg = colors.pink },
            CmpItemMenu = { fg = colors.surface2 },
            
            -- Line numbers with better contrast
            LineNr = { fg = colors.surface2, bg = colors.none },
            CursorLineNr = { fg = colors.lavender, bg = colors.none, bold = true },
            SignColumn = { bg = colors.none },
            
            -- Window separators
            WinSeparator = { fg = colors.surface1, bg = colors.none },
            VertSplit = { fg = colors.surface1, bg = colors.none },
            
            -- Status line improvements
            StatusLine = { fg = colors.text, bg = colors.surface0 },
            StatusLineNC = { fg = colors.surface2, bg = colors.none },
            
            -- Which-key glass effect
            WhichKey = { bg = colors.none, fg = colors.text },
            WhichKeyFloat = { bg = colors.none},
            WhichKeyBorder = { fg = colors.surface2, bg = colors.surface0 },
            WhichKeyGroup = { fg = colors.blue },
            WhichKeyDesc = { fg = colors.pink },
            WhichKeySeperator = { fg = colors.surface2 },
            WhichKeyValue = { fg = colors.green },
            
            -- Terminal transparency
            TerminalNormal = { bg = colors.none },
            TerminalNormalNC = { bg = colors.none },
            
            -- Tab line
            TabLine = { bg = colors.surface0, fg = colors.surface2 },
            TabLineFill = { bg = colors.none },
            TabLineSel = { fg = colors.text, bg = colors.surface1, bold = true },
            
            -- Additional fixes for glass effect
            EndOfBuffer = { bg = colors.none, fg = colors.base },
            NonText = { fg = colors.surface0 },
            Folded = { bg = colors.surface0, fg = colors.overlay1 },
            FoldColumn = { bg = colors.none, fg = colors.surface2 },
        }
    end,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = {
            enabled = true,
            style = "nvchad", -- Better integration style
        },
        which_key = true,
        bufferline = true,
        mason = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
    },
})

-- Setup colorscheme
vim.cmd.colorscheme("catppuccin")

-- Enhanced transparency settings - order matters!
local function set_transparent_bg()
    local highlights = {
        "Normal",
        "SignColumn", 
        "EndOfBuffer",
        "NormalNC",
    }
    
    for _, name in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, { bg = "none", ctermbg = "none" })
    end
end

-- Apply transparency after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = set_transparent_bg,
})

-- Initial application
set_transparent_bg()

-- Terminal-specific transparency
vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
})

-- Optional: Add these settings for better transparency support
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.termguicolors = true
