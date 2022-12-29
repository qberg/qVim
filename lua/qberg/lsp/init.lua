local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("qberg.lsp.mason")
require("qberg.lsp.handlers").setup()
require("qberg.lsp.rust-tools")
require("qberg.lsp.haskell-tools")
require("qberg.lsp.null-ls")
