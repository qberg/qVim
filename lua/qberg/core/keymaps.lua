----------------------------------
---- User defined keymappings ----
----------------------------------


--Remap space as leader key
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- set leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---------------------------------------------
-- Normal mode
---------------------------------------------
-- window management
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", ":close<CR>", opts)
-- better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)
-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
-- tab management
keymap("n", "<leader>to", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts)
keymap("n", "<leader>tn", ":tabn<CR>", opts)
keymap("n", "<leader>tp", ":tabp<CR>", opts)

-----------------------------------------------
-- Visual mode
-----------------------------------------------
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("x", "<leader>p", "\"_dP", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
------------------------------------------------

-----------------------------------------------
-- Plugin keybindings
-----------------------------------------------
-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-----------------------------------------------
-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>en", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>", opts) -- search neovim config files from anywhere

keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap("n", "<leader>fh", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts) -- finds string in the current file

-- zenmode
keymap("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
	end, 
opts)

-- fugitive
keymap("n", "<leader>gs", vim.cmd.Git, opts)
