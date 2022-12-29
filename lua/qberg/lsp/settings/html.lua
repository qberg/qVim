local util = require 'lspconfig.util'

return {
	cmd = {'vscode-html-language-server', '--stdio'},
	filetypes = {
		"html",
		"htmldjango",
	},
	root_dir = util.root_pattern{
		'package.json',
		'.git'
	},
	single_file_support =true,
	settings = {},
	init_options = {
		provideFormatter = true,
		configurationSection = { 
			"html",
			"css",
			"javascript" 
		},
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
}
