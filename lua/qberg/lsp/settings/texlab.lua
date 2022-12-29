local util = require 'lspconfig.util'

return {
	cmd = { 'texlab' },
	filetypes = {'tex','plaintex','bib'},
	root_dir = function(fname)
		return util.root_pattern '.latexmkrc'(fname) or util.find_git_ancestor(fname)
	end,
	single_file_support = true,
	settings = {
		texlab = {
			rootDirectory = nil,
			build = {
				executable = 'latexmk',
				args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
				onSave = false,
				forwardSearchAfter = false,
			},
			auxDirectory = '.',
			forwardSearch = {
				executable = nil,
				args = {},
			},
			chktex = {
				onOpenAndSave = false,
				onEdit = false,
			},
			diagnosticsDelay = 300,
			latexFormatter = 'latexindent',
			latexindent = {
				['local'] = nil, -- local is a reserved keyword
				modifyLineBreaks = false,
			},
			bibtexFormatter = 'texlab',
			formatterLineLength = 80,
		},
	},
}
