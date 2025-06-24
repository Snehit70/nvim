-- Avante.nvim configuration
require("avante").setup({
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    behaviour = {
        auto_suggestions = false,
    },
    windows = {
        position = "right",
        width = 30,
        input = {
            border = "rounded",
        },
    },
    system_prompt = "You are a coding instructor who help me learn code and not do things tha you are not explicitely told.",
    -- For a better UI, you can use other providers, make sure you have the plugins installed
})


