local fn = vim.fn

-- Packer bootstrapping
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end


return packer.startup(function(use)
	-----------------------------------------------------------------------
	use 'wbthomason/packer.nvim' -- Self-care for packer
    -----------------------------------------------------------------------
	---------------------- My Plugins -------------------------------------
	-----------------------------------------------------------------------
	
	-- Useful lua functions for other packages
	use {
		"nvim-lua/plenary.nvim",
	}
	
	-- Popup API from vim in neovim
	use {
		"nvim-lua/popup.nvim",
	}

	-- telescope
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = "make"
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- file-explorer
	use('nvim-tree/nvim-tree.lua')

	-- Colorschemes
	use { 'folke/tokyonight.nvim'}
	use { 'rktjmp/lush.nvim'}
	use { 'metalelf0/jellybeans-nvim'}
	use { 'rafi/awesome-vim-colorschemes' } 
	-- devicons
	use { 'kyazdani42/nvim-web-devicons' }
	-- statusbar
	use { "nvim-lualine/lualine.nvim" }

	-- completion
	use { "hrsh7th/nvim-cmp" } -- The completion plugin
	use { "hrsh7th/cmp-buffer" } -- buffer completions
	use { "hrsh7th/cmp-path" } -- path completions
	use { "hrsh7th/cmp-nvim-lua" }

	-- snippets
	use { "L3MON4D3/LuaSnip" }
	use { "saadparwaiz1/cmp_luasnip" }

	-- lsp
	-- use { "williamboman/mason.nvim" }
	-- use  { "williamboman/mason-lspconfig.nvim" }
	-- use { "neovim/nvim-lspconfig" }
	-- use { "hrsh7th/cmp-nvim-lsp" }
	-- -- formatting and linting
	-- use { "jose-elias-alvarez/null-ls.nvim" }
	-- use { "jayp0521/mason-null-ls.nvim" }

	-- treesitter
	-- use ({
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	run = function()
	-- 		local ts_update = require("nvim-treesitter.install").update({ with_sync = true})
	-- 	ts_update()
	-- })

	-- Markdown preview
	use { 
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install", 
		cmd = "MarkdownPreview",
	}

	
    ----------------------------------------------------------------------
    ----------------------------------------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
	----------------------------------------------------------------------
end)
