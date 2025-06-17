# My personal Neovim setup

### This is my file tree structure for my setup

```
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── keymaps.lua
│   │   ├── options.lua
│   │   └── plugins.lua
│   └── plugins
│       ├── bufferline.lua
│       ├── cmp.lua
│       ├── colorscheme.lua
│       ├── copilot.lua
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── nvim-tree.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── which-key.lua
│       └── winshift.lua
└── README.md

```
## Setup

### Ensure neovim is installed  before setting this up

```
nvim -v
```

- To remove previous neovim config

```
rm -rf ~/.config/nvim
```

- To instead  keep backup of the previous cofiguration
```
mv ~/.config/nvim ~/.config/nvim-backup
```

- To clone this current repo to the correct location 
```
git clone https://github.com/Snehit70/nvim.git ~/.config/nvim
```
- To delete and clone  the repo 
```
rm -rf ~/.config/nvim && git clone https://github.com/Snehit70/nvim.git ~/.config/nvim
```
