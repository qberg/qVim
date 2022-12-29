local util = require 'lspconfig.util'

local css_settings = {
  validate = true,
  lint = {},
}

return {
	cmd = {'vscode-html-language-server', '--stdio'},
	filetypes = {'css', 'scss', 'less'},
	root_dir = util.root_pattern{
		'package.json',
		'.git'
	},
	settings = {
		css = css_settings,
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
}
