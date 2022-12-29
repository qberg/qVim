local util = require 'lspconfig.util'

return {
	init_options = { hostInfo = 'neovim' },
	cmd = { 'typescript-language-server', '--stdio'},
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
	root_dir = function(fname)
		return util.root_pattern 'tsconfig.json'(fname)
			or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
	end,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
}
