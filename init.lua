--hey this is my personal from scratch neovim setup
--version 2 with modularised setup

--setting up leader key to space
vim.g.mapleader = " "



-- load core config
require("core.options")
require("core.keymaps")


--setup plugins via lazy.nvim
require("core.plugins")

--Plugins-specific configs
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.colorscheme")
require("plugins.lualine")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.which-key")
require("plugins.bufferline")
require("plugins.winshift")
require("plugins.copilot")
require("plugins.autotag")
require("plugins.autopairs")
