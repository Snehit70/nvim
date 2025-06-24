# My Custom Neovim Configuration

Welcome to my personal Neovim setup! This configuration is tailored for an enhanced coding experience with modern tools and plugins.

## File Structure

```
├── init.lua                # Entry point for the configuration
├── lazy-lock.json          # Plugin lock file
├── lua
│   ├── core
│   │   ├── keymaps.lua      # Key mapping configurations
│   │   ├── options.lua      # Neovim settings and options
│   │   └── plugins.lua      # Plugin management setup
│   └── plugins
│       ├── autopairs.lua    # Auto-closing brackets and quotes
│       ├── autotag.lua      # Auto-close and rename HTML tags
│       ├── avante.lua       # Custom plugin for productivity
│       ├── bufferline.lua   # Bufferline UI enhancements
│       ├── cmp.lua          # Code completion setup
│       ├── colorscheme.lua  # Theme and colorscheme setup
│       ├── copilot_chat.lua # AI-powered chat assistant
│       ├── copilot.lua      # AI code suggestions
│       ├── gitsigns.lua     # Git integration
│       ├── html_snippets.lua # HTML snippets for rapid development
│       ├── indent_blackline.lua # Visual indentation guides
│       ├── lsp.lua          # Language Server Protocol setup
│       ├── lualine.lua      # Statusline customization
│       ├── nvim-tree.lua    # File explorer setup
│       ├── telescope.lua    # Fuzzy finder and search
│       ├── treesitter.lua   # Syntax highlighting and code parsing
│       ├── which-key.lua    # Keybinding helper
│       └── winshift.lua     # Window arrangement tool
└── README.md
```

## Setup Instructions

### Prerequisites
Ensure Neovim is installed and accessible via your terminal:

```
nvim -v
```
If you don't have Neovim installed, download it from [Neovim's official website](https://neovim.io/).

### Installation Steps

1. **Remove Existing Configuration:**
   ```bash
   rm -rf ~/.config/nvim
   ```

2. **Backup Existing Configuration:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

3. **Clone This Repository:**
   ```bash
   git clone https://github.com/Snehit70/nvim.git ~/.config/nvim
   ```

4. **Replace Existing Configuration:**
   ```bash
   rm -rf ~/.config/nvim && git clone https://github.com/Snehit70/nvim.git ~/.config/nvim
   ```

### Features Overview

- **Lazy.nvim Plugin Manager**: Efficiently manages plugins.
- **Pre-configured Plugins**: Enhance productivity with tools like Telescope for fuzzy searching, Treesitter for better syntax highlighting, and Lualine for statusline customization.
- **Language Server Protocol (LSP)**: Provides intelligent code completion, diagnostics, and refactoring support.
- **AI Assistance**: Integrated Copilot for code suggestions and Copilot Chat for interactive coding help.
- **Custom Keymaps**: Simplified and intuitive keybindings for faster navigation and actions.
- **HTML Enhancers**: Plugins like Emmet for HTML/CSS tag expansion and vim-closetag for auto-closing HTML tags.
- **Git Integration**: Visualize and manage Git changes directly in Neovim.
- **Markdown Preview**: Instantly preview Markdown files within Neovim.
- **Avante.nvim**: A productivity-focused plugin with advanced interaction features.
- **HTML Snippets**: Rapid development using predefined snippets for HTML.
- **Indent Guides**: Enhanced visual guides for indentation with `Indent-Blankline`.
- **Window Management**: Seamlessly arrange windows using `WinShift`.

### Troubleshooting

- **Plugin Installation Issues**: Ensure you have a working internet connection and the `git` command is available.
- **Error Messages**: Run `:checkhealth` in Neovim to diagnose issues and identify missing dependencies.
- **Markdown Preview Not Working**: Verify Node.js is installed on your system, as it's required for the `markdown-preview.nvim` plugin.

Enjoy coding with this custom Neovim setup! Feel free to explore and modify it to suit your needs.
