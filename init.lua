-- This file is the main entry point for my personal Neovim setup, version 2.
-- It includes modular configuration for organizing various aspects of Neovim.

-- Set the leader key to space.
vim.g.mapleader = " "



-- Load core configuration for options and keymaps.
require("core.options") -- Contains Neovim options like settings for text editing, behavior, etc.
require("core.keymaps") -- Defines custom keybindings for convenience and productivity.


-- Set up plugins using the Lazy.nvim plugin manager.
require("core.plugins") -- Specifies and manages a list of plugins.

-- Load individual configurations for each plugin.
require("plugins.nvim-tree") -- Provides a file explorer tree.
require("plugins.telescope") -- Adds fuzzy finder and search capabilities.
require("plugins.treesitter") -- Enhances syntax highlighting and code understanding.
require("plugins.colorscheme") -- Sets up themes and color schemes.
require("plugins.lualine") -- Configures the status line.
require("plugins.lsp") -- Integrates Language Server Protocol for code intelligence.
require("plugins.cmp") -- Configures completion plugins for code suggestions.
require("plugins.gitsigns") -- Adds Git integration and visual indicators.
require("plugins.which-key") -- Displays available keybindings.
require("plugins.bufferline") -- Manages buffers visually.
require("plugins.winshift") -- Facilitates window arrangement.
require("plugins.copilot") -- AI-powered code suggestions.
require("plugins.autotag") -- Auto-closes and renames HTML tags.
require("plugins.autopairs") -- Auto-closes brackets and quotes.
require("plugins.copilot_chat") -- Chat-based coding assistant.
require("plugins.avante") -- Custom plugin tailored to specific needs.
