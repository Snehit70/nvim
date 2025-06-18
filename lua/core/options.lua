--options file for all the nvim options


--absolute line numbers
vim.opt.number = true

--relative line numbers
vim.opt.relativenumber = true

--spaces instead of tabs
vim.opt.expandtab = true

--number of spaces a tab inserts
vim.opt.tabstop = 4

--number of spaces for auto indent
vim.opt.shiftwidth = 4


-- use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enhanced indentation settings
vim.opt.smartindent = true      -- Smart auto-indenting
vim.opt.autoindent = true       -- Copy indent from current line
vim.opt.breakindent = true      -- Preserve indentation in wrapped text
vim.opt.showbreak = "↪ "        -- Character to show at line breaks
vim.opt.list = true             -- Show invisible characters
vim.opt.listchars = {           -- Define which invisible chars to show
    tab = "→ ",
    eol = "↲",
    trail = "·",
    extends = "▶",
    precedes = "◀",
    space = "·",
}
