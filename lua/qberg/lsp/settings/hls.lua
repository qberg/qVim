local util = require 'lspconfig.util'

return {
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	filetypes = { "haskell", "lhaskell" },
	root_dir = function(filepath)
		return (
			util.root_pattern('hie.yaml','stack.yaml','cabal.project')(filepath)
			or util.root_pattern('*.cabal', 'package.yaml')(filepath) or
			vim.loop.cwd()
		)
	end,
	single_file_support = true,
	settings = {
		haskell = {
			formattingProvider = "ormolu",
			hlintOn = false,
		},
	},
	lspinfo = function(cfg)
		local extra = {}
		local function on_stdout(_, data, _)
			local version = data[1]
			table.insert(extra, 'version:   ' .. version)
		end
		local opts = {
			cwd = cfg.cwd,
			stdout_buffered = true,
			on_stdout = on_stdout,
		}
		local chanid = vim.fn.jobstart({ cfg.cmd[1], '--version' }, opts)
		vim.fn.jobwait { chanid }
		return extra
	end,
}
