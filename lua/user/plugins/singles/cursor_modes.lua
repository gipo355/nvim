return {
    'mvllow/modes.nvim',
    event = 'BufReadPre',
    enabled = _G.user.cursor_modes.enable,
    -- tag = 'v0.2.0',
    config = function()
        require('modes').setup({
            -- colors = {
            --     bg = '', -- Optional bg param, defaults to Normal hl group
            --     copy = '#f5c359',
            --     delete = '#c75c6a',
            --     insert = '#78ccc5',
            --     visual = '#9745be',
            --     replace = '#e5c07b',
            -- },
            -- Set opacity for cursorline and number background
            -- line_opacity = 0.15,

            -- Enable cursor highlights
            set_cursor = true,

            -- Enable cursorline initially, and disable cursorline for inactive windows
            -- or ignored filetypes
            set_cursorline = false,

            -- Enable line number highlights to match cursorline
            set_number = false,

            -- Disable modes highlights in specified filetypes
            -- Please PR commonly ignored filetypes
            ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
        })
    end,
}
