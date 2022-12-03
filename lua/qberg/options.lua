---------------------------------------
---- All default settings of NeoVim----
---------------------------------------

local options = {
	clipboard 		= "unnamedplus", -- allows neovim to access system clipboard
	cmdheight 		= 1, -- bigger spatial display for messages
	conceallevel 	= 0, -- so that `` is visible in markdown files
	fileencoding 	= "utf-8", -- the encoding written to a file
	guicursor 		= "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50", -- block in normal and beam cursor in insert
	mouse 			= "a", -- allows mouse to be used inside neovim
	number			= true, -- set numbered lines
	numberwidth		= 2, -- number column width changed from default 4
	pumheight 		= 10, -- pop up menu height
	relativenumber  = true, -- relative numbering of lines for easier navigation
	shiftwidth		= 4, -- number of spaces inserted while indenting
	showmode 		= false, -- know it in your cursor
	signcolumn 		= "yes", -- shows the sign column to avoid shifting of text each time
	smartcase 		= true, -- smart case
	splitbelow		= true, -- force all horizontal splits to go below current window
	splitright		= true, -- force all vertical splits to go to the right of the current window
	signcolumn 		= "yes", -- shows the sign column to avoid shifting of text each time
	tabstop			= 4, -- insert four spaces for a tab   
	title 			= true, -- set the title of the window to the value of the titlestring
	timeoutlen		= 800, -- time to wait for a mapped sequence to complete (in milliseconds)
	ttimeoutlen		= 0, -- time to wait for a keycode sequence to complete
	termguicolors	= true, -- terminal colors
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

