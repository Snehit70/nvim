local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body) -- this expands snippets
    end,
    },

    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" }, --lsp completions (highest priority
        { name = "luasnip" },  -- snippet completions
        { name = "buffer" },   -- text from current buffer
        { name = "path" },     --file path completions
        { name = "copilot", group_index = 2 }, --copilot completions ( lowest priority)
    },
})

--setup cmdline completions for '/' (search)
cmp.setup.cmdline('/',{
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

--setup cmdlien completion for ':' (commands)
cmp.setup.cmdline(':',{
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'path' },
        { name = 'cmdline' }
    }
})


