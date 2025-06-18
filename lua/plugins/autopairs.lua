local autopairs = require("nvim-autopairs")

autopairs.setup({
  check_ts = true, -- Enable treesitter integration
  ts_config = {
    lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
    javascript = { "string", "template_string" },
    java = false, -- Don't check treesitter on java
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = '<M-e>', -- Alt+e to fast wrap
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr'
  },
})

-- Integration with nvim-cmp (since you have cmp setup)
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
