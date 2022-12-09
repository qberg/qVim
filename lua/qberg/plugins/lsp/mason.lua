-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

---------------------------------------
-- list of servers for mason to install
local servers = {
	"rust_analyzer",
	"sumneko_lua",
	"cssls",
	"html",
	"tailwindcss",
	"tsserver",
	"pyright",
	"emmet_ls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

-- list of formatters and linters for null-ls to install
linters = {
	"prettier", -- ts/js formatter
	"stylua", -- lua formatter
	"eslint_d", -- ts/js linter
}
-------------------------------------------
 

-------------------------------------------
-------------------------------------------
-- enable mason
mason.setup(settings)
-------------------------------------------
-- mason_lspconfig
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true, -- not the same as ensure_installed
})
-------------------------------------------
-- enable null-ls 
mason_null_ls.setup({
  ensure_installed = linters,
  automatic_installation = true,
})
--------------------------------------------
--------------------------------------------
