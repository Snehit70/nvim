--Mason setup - this manages installation of lsp servers formatters and linters
require("mason").setup({
    ui= {
        border = "rounded",
        width = 0.8,
        height = 0.8,
    }
})

-- lsp config bridges mason and lspconfig
require("mason-lspconfig").setup({
    --these will be automatically installed if not present
    ensure_installed = {
        "pyright",      --python language server for type checking
        "ts_ls",        -- ts/js server
        "lua_ls",       --lua server essential for neovim config editing
        "html",         --html server
        "cssls",        --css server
        "jsonls",       --json server with schema validation
        "bashls",       --bash server for shell script
        "marksman",     --markdown server

    },
    --this automatically sets up servers with default config
    automatic_installation = true,
})

-- get enhanced capabilities from nvim-cmp for autcompletion
local capabilities =require("cmp_nvim_lsp").default_capabilities()


-- this tells lsp servers what features out client supports i mean neovim
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- get the lspconfig module
local lspconfig = require("lspconfig")

--define on_attach fucntion for lsp keymaps
local function on_attach(client,bufnr)
    local opts = {buffer = bufnr, silent = true }

    vim.keymap.set("n","gd",vim.lsp.buf.definition, opts) --go to definition
    vim.keymap.set("n","K", vim.lsp.buf.hover, opts)      --show documentation
    vim.keymap.set("n","<leader>ca", vim.lsp.buf.code_action,opts) -- code actions
    vim.keymap.set("n","<leader>rn",vim.lsp.buf.rename,opts)   --rename variable
        
end

--python server config
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true, --auto finds python paths
                diagnosticMode = "workspace", --analyse entire workspace 
                useLibraryCodeForTypes =true, --use library code for better type info
            }
        }
    }   
})

--ts/js server
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    --this server works with default settings for most projects

})

--lua server ( for neovim config)
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT", -- this is neovims lua
            },
            diagnostics = {
                globals = { "vim" }, -- recognise vim as a global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("",true), --make server aware fo neovim runtime
                checkThirdParty = false, 
            
            },
            telemetry ={
                enable = false, --Dont send usage data
            },
        },  
    },
})

--html server
lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

--css server
lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

--json server with schema validation
lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
                schema = require("schemastore").json.schemas(), 
                validate = {enable = true},
            },
        },
})

--bash server
lspconfig.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

--markdown server
lspconfig.marksman.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
