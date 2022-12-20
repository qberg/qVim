> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra

## Instructions of usage
### Upgrade NeoVim to latest release

Assuming you [built from source](https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start), `cd` into the folder where you cloned `neovim` and run the following commands. 
```
git pull
make distclean && make CMAKE_BUILD_TYPE=Release
git checkout v0.9.0
sudo make install
nvim -v
```

## Structure

```
├── init.lua  
├── lua
│   ├── qberg                           user named module to avoid clashes        
    │  ├── core                 
│   │  │   ├── colorscheme.lua
│   │  │   ├── keymaps.lua              keymaps custom defined 
│   │  │   └── options.lua              setting vim options
│   │  └── plugins                      configs of plugins 
│   │       ├── telescope
│   │       │   ├── init.lua
│   │       │   └── plugins.lua
│   │       ├── toggleterm
│   │       │   ├── init.lua
│   │       │   └── plugins.lua
│   │       ├── autopairs.lua
│   │       ├── impatient.lua
│   │       ├── lualine.lua
│   │       ├── nvim-cmp.lua
│   │       ├── nvim-tree.lua
│   │       ├── treesitter.lua
│   │       ├── vim-illuminate.lua
│   │       └── whichkey.lua
```
