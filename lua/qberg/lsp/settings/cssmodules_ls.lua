local util = require 'lspconfig.util'

return {
	cmd = {'cssmodules-language-server'},
    filetypes = {
		'javascript', 
		'javascriptreact',
		'typescript',
		'typescriptreact'
	},
    root_dir = util.find_package_json_ancestor,
}
