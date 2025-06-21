require("CopilotChat").setup({
    window = {
        title = function ()
            local model = require("CopilotChat").get_config().model or "gpt-4.1"
            return "CopilotChat- "  .. model
        end,
    }
  -- Default setup first
})

-- Then add custom positioning
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.cmd("wincmd L")  -- Move window to far right
  end,
})
