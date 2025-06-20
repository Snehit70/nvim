--[[
require("tokyonight").setup({
  style = "night", -- The theme comes in four styles, storm, moon, night and day
  transparent = true, -- Enable this for transparent background
  terminal_colors = true, -- Configure the colors used when opening a `:terminal`
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function(highlights, colors)
    highlights.Comment = { fg = colors.comment }
    
    -- Enhanced transparency
    highlights.Normal = { bg = "NONE" }
    highlights.NormalFloat = { bg = colors.bg_dark }
    highlights.NormalNC = { bg = "NONE" }
    highlights.SignColumn = { bg = "NONE" }
    highlights.EndOfBuffer = { bg = "NONE" }
    
    -- Bufferline enhancements
    highlights.BufferLineFill = { bg = "NONE" }
    highlights.BufferLineBackground = { fg = colors.fg_gutter, bg = colors.bg_dark }
    highlights.BufferLineTab = { fg = colors.fg_gutter, bg = colors.bg_dark }
    highlights.BufferLineTabSelected = { fg = colors.fg, bg = colors.bg_highlight, bold = true }
    
    -- NvimTree transparency
    highlights.NvimTreeNormal = { fg = colors.fg_sidebar, bg = colors.bg_dark }
    highlights.NvimTreeWinSeparator = { fg = colors.border, bg = "NONE" }
    
    -- Telescope transparency
    highlights.TelescopeNormal = { bg = colors.bg_dark }
    highlights.TelescopeBorder = { fg = colors.border, bg = colors.bg_dark }
    highlights.TelescopePromptNormal = { bg = colors.bg_highlight }
    highlights.TelescopePromptBorder = { fg = colors.border, bg = colors.bg_highlight }
    
    -- Which-key transparency  
    highlights.WhichKeyFloat = { bg = colors.bg_dark }
    highlights.WhichKeyBorder = { fg = colors.border, bg = colors.bg_dark }
    
    -- Terminal transparency
    highlights.TerminalNormal = { bg = "NONE" }
    highlights.TerminalNormalNC = { bg = "NONE" }
  end,
})
]]--
-- Load the colorscheme
vim.cmd.colorscheme("tokyonight")
