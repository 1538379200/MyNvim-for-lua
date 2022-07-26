require'lspconfig'.pyright.setup{}
require("nvim-lsp-installer").setup {}
require('lspconfig')['golangci_lint_ls'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
}
