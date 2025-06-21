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
- **Pre-configured Plugins**: Enhance productivity with tools like Telescope, Treesitter, Lualine, and more.
- **Language Server Protocol (LSP)**: Provides intelligent code completion, diagnostics, and more.
- **AI Assistance**: Integrated Copilot for code suggestions and chat-based coding.
- **Custom Keymaps**: Simplified keybindings for faster navigation and actions.

Enjoy coding with this custom Neovim setup! Feel free to explore and modify it to suit your needs.
