-- Protected calling
local setup,nvimtree = pcall(require, "nvim-tree")
if not setup then
	print("Install nvim-tree using packer and try again...")
	return
end

local icons = require('qberg.utils.icons')

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
		icons = {
			glyphs = {
				git = icons.git,
				folder = icons.folder,
			},
		},
    group_empty = true,
  },
  filters = {
    dotfiles = false,
		custom = {
			".git",
			"node_modules",
			".cache",
			"__pycache__",
		},
  },
})
