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
        { name = "nvim_lsp" },
        { name = "luasnip" }
    },
})


