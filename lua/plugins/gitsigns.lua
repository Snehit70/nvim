require("gitsigns").setup({
    signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    
    -- Enable line highlighting
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
    },
    
    -- Enhanced diff viewing
    diff_opts = {
        internal = true,
    },
    
    -- Key mappings for git operations
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        
        -- Navigation between hunks
        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true, buffer=bufnr, desc="Next git hunk"})
        
        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true, buffer=bufnr, desc="Previous git hunk"})
        
        -- Actions
        vim.keymap.set('n', '<leader>gs', gs.stage_hunk, {buffer=bufnr, desc="Stage hunk"})
        vim.keymap.set('n', '<leader>gr', gs.reset_hunk, {buffer=bufnr, desc="Reset hunk"})
        vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {buffer=bufnr, desc="Stage selected hunk"})
        vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {buffer=bufnr, desc="Reset selected hunk"})
        
        -- Stage/unstage entire buffer
        vim.keymap.set('n', '<leader>gS', gs.stage_buffer, {buffer=bufnr, desc="Stage entire buffer"})
        vim.keymap.set('n', '<leader>gR', gs.reset_buffer, {buffer=bufnr, desc="Reset entire buffer"})
        
        -- Undo staging
        vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk, {buffer=bufnr, desc="Undo stage hunk"})
        
        -- Preview changes
        vim.keymap.set('n', '<leader>gp', gs.preview_hunk, {buffer=bufnr, desc="Preview hunk"})
        
        -- Blame line
        vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end, {buffer=bufnr, desc="Git blame line"})
        vim.keymap.set('n', '<leader>gB', gs.toggle_current_line_blame, {buffer=bufnr, desc="Toggle line blame"})
        
        -- Diff views
        vim.keymap.set('n', '<leader>gd', gs.diffthis, {buffer=bufnr, desc="Diff this file"})
        vim.keymap.set('n', '<leader>gD', function() gs.diffthis('~') end, {buffer=bufnr, desc="Diff against HEAD~"})
        
        -- Text object for hunks
        vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {buffer=bufnr, desc="Select hunk"})
    end
})
