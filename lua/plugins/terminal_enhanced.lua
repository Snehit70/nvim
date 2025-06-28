local Terminal = require('toggleterm.terminal').Terminal

-- Function to create terminals that can be focused/unfocused like Avante
local function create_smart_terminal(direction, size)
    return Terminal:new({
        direction = direction,
        size = size,
        close_on_exit = false,
        on_open = function(term)
            -- Enter insert mode when opening terminal
            vim.cmd("startinsert!")
            -- Set up buffer-local keymaps for this terminal
            local opts = {buffer = term.bufnr, silent = true}
            
            -- Focus switching keymaps (similar to Avante)
            vim.keymap.set('t', '<C-h>', function()
                vim.cmd('wincmd h')
            end, opts)
            vim.keymap.set('t', '<C-j>', function()
                vim.cmd('wincmd j')
            end, opts)
            vim.keymap.set('t', '<C-k>', function()
                vim.cmd('wincmd k')
            end, opts)
            vim.keymap.set('t', '<C-l>', function()
                vim.cmd('wincmd l')
            end, opts)
            
            -- Quick focus back to previous window
            vim.keymap.set('t', '<C-\\><C-n>', function()
                vim.cmd('stopinsert')
                vim.cmd('wincmd p')  -- Go to previous window
            end, opts)
        end,
        on_close = function()
            -- Return focus to previous window when closing
            vim.cmd('wincmd p')
        end,
    })
end

-- Create different terminal instances
local horizontal_term = create_smart_terminal("horizontal", 15)
local vertical_term = create_smart_terminal("vertical", 80)
local float_term = create_smart_terminal("float", 20)

-- Enhanced terminal functions with focus management
function _G.toggle_horizontal_terminal()
    horizontal_term:toggle()
end

function _G.toggle_vertical_terminal()
    vertical_term:toggle()
end

function _G.toggle_float_terminal()
    float_term:toggle()
end

-- Smart focus function - like Avante's focus feature
function _G.focus_terminal()
    -- Find if any terminal is open and focus it
    for _, term in pairs(require('toggleterm.terminal').get_all()) do
        if term:is_open() then
            local win_id = term.window
            if win_id and vim.api.nvim_win_is_valid(win_id) then
                vim.api.nvim_set_current_win(win_id)
                vim.cmd("startinsert!")
                return
            end
        end
    end
    -- If no terminal is open, open the horizontal one
    toggle_horizontal_terminal()
end

-- Quick send text to terminal function
function _G.send_to_terminal(text)
    local current_term = require('toggleterm.terminal').get_all()[1]
    if current_term and current_term:is_open() then
        current_term:send(text)
    else
        print("No terminal open")
    end
end
