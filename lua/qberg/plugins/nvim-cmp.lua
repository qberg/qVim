local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- Order in which the completions will be suggested
local sources = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	buffer = "[Buffer]",
	path = "[Path]",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
	icons[kind] = icons[kind].." ("..kind..")"
end

-- cmp config
vim.opt.shortmess:append('c')

cmp.setup {
	completion = {
		completeopt = "menu,menuone,noselect"
	},
	window = {
		documentation = {
			border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }
		}
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = icons[vim_item.kind]
			vim_item.menu = sources[entry.source.name]
			return vim_item
		end
	},
	mapping = {
		["<C-w>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-s>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "", true)
			else
				fallback()
			end
		end, { 'i', 's' }),
		["<S-Tab>"] = cmp.mapping(function(_)
			luasnip.jump(-1)
		end, { 'i', 's' }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = false,
		})
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	}
}

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = ''
			return vim_item
		end
	},
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = ''
			return vim_item
		end
	},
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

