-- Lazy

-- mini colors
-- chan_add('saturation', -10,  { filter = 'bg' })
-- chan_add('saturation', -2,  { filter = 'fg' })
-- chan_add('lightness', 2,  { filter = 'bg' })
-- chan_add('temperature', 10,  { filter = 'bg' })
return {
    'vague2k/vague.nvim',
    enabled = _G.user.theme() == 'vague',
    config = function()
        _G.user.themes.vague = 'vague'
        require('vague').setup({
            transparent = false, -- don't set background
            style = {
                -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                comments = 'italic',
                conditionals = 'none',
                functions = 'none',
                keywords = 'none',
                headings = 'bold', -- markdown headings
                operators = 'none',
                keyword_return = 'none',
                strings = 'italic',
                variables = 'none',
            },
            -- These are the default colors, but they are overideable.
            -- Different highlights which may be non related share some colors, so expirement.
            colors = {
                bg = '#18191a',
                fg = '#cdcdcd',
                floatBorder = '#878787',
                line = '#282830',
                comment = '#646477',
                builtin = '#be8c8c',
                func = '#be8c8c',
                string = '#d7b797',
                number = '#d2a374',
                property = '#b4b4ce',
                constant = '#b4b4ce',
                parameter = '#b9a3ba',
                visual = '#363738',
                error = '#e6788c',
                warning = '#e6be8c',
                hint = '#8ca0dc',
                operator = '#96a3b2',
                keyword = '#7894ab',
                type = '#a1b3b9',
                search = '#465362',
                -- used mostly in git related highlights
                plus = '#a3cd81',
                delta = '#e6be8c',
            },
        })
    end,
}
