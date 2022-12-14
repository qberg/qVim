## Structure

```
├── init.lua  
├── lua
│   ├── qberg                   heart of the configuration
        ├── core 
│   │       ├── colorscheme.lua
│   │       ├── keymaps.lua             keymaps custom defined 
│   │       └── options.lua             setting vim options
│   └── plugins                    plugins module usage example
│       ├── completion
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── lang
│       │   ├── config.lua
│       │   └── plugins.lua
│       ├── tools
│       │   ├── config.lua
│       │   └── plugins.lua
│       └── ui
│           ├── config.lua
│           ├── eviline.lua
│           └── plugins.lua

```

## Upgrade to latest release

Assuming you [built from source](https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start), `cd` into the folder where you cloned `neovim` and run the following commands. 
```
git pull
make distclean && make CMAKE_BUILD_TYPE=Release
git checkout v0.9.0
sudo make install
nvim -v
```

> The computing scientist's main challenge is not to get confused by the complexities of his own making. 

\- Edsger W. Dijkstra
