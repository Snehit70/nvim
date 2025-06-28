-- File: ~/.config/nvim/lua/plugins/cmp.lua (or your equivalent Neovim config file)

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Performance optimization: reduce update time for faster completion triggers
vim.opt.updatetime = 100

-- Main setup call for nvim-cmp.
-- This block defines the DEFAULT behavior for all filetypes.
-- It MUST be called before any filetype-specific overrides.
cmp.setup({
  snippet = {
    -- This function tells cmp how to expand snippets.
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Key mappings for the completion menu
  mapping = cmp.mapping.preset.insert({
    -- Select next/previous item
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Confirm selection
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),

    -- Manually trigger completion
    ["<C-Space>"] = cmp.mapping.complete(),
    -- Abort completion
    ["<C-e>"] = cmp.mapping.abort(),
  }),

  -- Base sources for completion, ordered by priority.
  -- These will be used for all filetypes unless overridden below.
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 1000 },
    { name = "copilot", priority = 900, max_item_count = 3 },
    { name = "luasnip", priority = 700, max_item_count = 5 },
    { name = "path", priority = 400, max_item_count = 8 },
  }, {
    -- This buffer source is optimized to only scan currently visible buffers.
    {
      name = "buffer",
      priority = 500,
      max_item_count = 10,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),

  -- UI and Formatting enhancements
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Add a menu entry to show the source of the completion
      local menu_map = {
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
        copilot = "[AI]",
      }
      vim_item.menu = menu_map[entry.source.name] or "[?]"

      -- Truncate long completion entries for performance and readability
      if #vim_item.abbr > 50 then
        vim_item.abbr = string.sub(vim_item.abbr, 1, 47) .. "..."
      end

      return vim_item
    end,
  },

  -- Window appearance (bordered windows for completion and documentation)
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  -- Performance settings for a responsive experience
  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
    async_budget = 2, -- Slightly increased to prevent dropping slow sources like LSP
    max_view_entries = 200,
  },

  -- General completion behavior
  completion = {
    keyword_length = 2,
    autocomplete = {
      "TextChanged",
      "InsertEnter",
    },
  },

  -- Experimental features
  experimental = {
    -- Show inline "ghost text" for the top completion item
    ghost_text = { hl_group = "Comment" },
  },
})

---------------------------------------------------------------------
-- FILETYPE-SPECIFIC OVERRIDES
-- These calls modify the default setup for specific filetypes.
---------------------------------------------------------------------

-- For Markdown, we only want simple sources like buffer text and file paths.
cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = 'buffer', priority = 1000 },
    { name = 'path', priority = 500 },
    { name = 'luasnip', priority = 100 },
  }),
})

-- For Python, we want to prioritize LSP and Copilot for coding.
cmp.setup.filetype('python', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'copilot', priority = 900 },
    { name = 'buffer', priority = 300 },
    { name = 'luasnip', priority = 100 },
  }),
})

---------------------------------------------------------------------
-- CMDLINE COMPLETION SETUP
-- Separate setups for command-line mode completion.
---------------------------------------------------------------------

-- Completion for search (`/`)
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer', max_item_count = 8 },
  },
})

-- Completion for commands (`:`)
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path', max_item_count = 10 },
  }, {
    { name = 'cmdline', max_item_count = 15 },
  }),
})
