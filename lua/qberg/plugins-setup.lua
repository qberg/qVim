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
local setup, packer = pcall(require, "packer")
if not setup then
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

	-- for faster booting
	use { 'lewis6991/impatient.nvim' }

	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make',
			},
		},
		-- config = function()
		-- 	require('qberg.plugins.telescope.mappings').init()
		-- 	require('qberg.plugins.telescope')
		-- end,
		-- event = 'BufWinEnter',
		-- disable = vim.tbl_contains(user_config.disable_builtin_plugins, 'telescope'),
	})

	-- file-explorer
	use { 'nvim-tree/nvim-tree.lua' }
	-- terminal emulator
	use { "akinsho/toggleterm.nvim" }
	-- Colorschemes
	use { 'folke/tokyonight.nvim'}
	use { 'rktjmp/lush.nvim'}
	use { 'metalelf0/jellybeans-nvim'}
	use { 'rafi/awesome-vim-colorschemes' } 
	-- devicons
	use { 'kyazdani42/nvim-web-devicons' }
	-- statusbar
	use { "nvim-lualine/lualine.nvim" }
	
    -- git made awesome
	use('tpope/vim-fugitive')
	
	-- completion
	use { "hrsh7th/nvim-cmp" } -- The completion plugin
	use { "hrsh7th/cmp-buffer" } -- buffer completions
	use { "hrsh7th/cmp-path" } -- path completions
	use { "hrsh7th/cmp-nvim-lua" }

	-- snippets
	use { "L3MON4D3/LuaSnip" }
	use { "saadparwaiz1/cmp_luasnip" }

	-- lsp
	use { "williamboman/mason.nvim" }
	use  { "williamboman/mason-lspconfig.nvim" }
	use { "neovim/nvim-lspconfig" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use({ 
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	use {
		'MrcJkb/haskell-tools.nvim',
		requires = {
			'neovim/nvim-lspconfig',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim', -- optional
		},
		-- tag = 'x.y.z' -- [^1]
	}
	use { 'simrat39/rust-tools.nvim' }
	-- formatting and linting
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "jayp0521/mason-null-ls.nvim" }
	use{ 'MunifTanjim/prettier.nvim'} 
	use { "lukas-reineke/indent-blankline.nvim" }

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- highlighting
	use { 'RRethy/vim-illuminate' }
	-- auto closing
	use { "windwp/nvim-autopairs" }
	use { "windwp/nvim-ts-autotag" }

	-- Zen mode
	use("folke/zen-mode.nvim")

	-- Latex
	use { 'lervag/vimtex' } 
	-- Markdown
	use { 'lukas-reineke/headlines.nvim' }
	use { 
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install", 
		cmd = "MarkdownPreview",
	}

	-- uselesss plugins time
	--use 'eandrju/cellular-automaton.nvim' 
	
    ----------------------------------------------------------------------
    ----------------------------------------------------------------------
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
	----------------------------------------------------------------------
end)
