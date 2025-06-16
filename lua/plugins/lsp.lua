require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "ts_ls"},
})

local capabilities =require("cmp_nvim_lsp").default_capabilities()


local lspconfig = require("lspconfig")

lspconfig.pyright.setup({ capabilities = capabilities })
lspconfig.ts_ls.setup({ capabilities = capabilities })
