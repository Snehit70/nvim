require("CopilotChat").setup({
  -- Default setup first
})

-- Then add custom positioning
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.cmd("wincmd L")  -- Move window to far right
  end,
})
