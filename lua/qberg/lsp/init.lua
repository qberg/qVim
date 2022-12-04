local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("qberg.lsp.mason")
require("qberg.lsp.handlers").setup()
require("qberg.lsp.null-ls")
