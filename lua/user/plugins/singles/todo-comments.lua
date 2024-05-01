-- Highlight todo, notes, etc in comments
return {
    {
        'folke/todo-comments.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            local ok, comments = pcall(require, 'todo-comments')

            if not ok then
                return
            end

            comments.setup({
                colors = {
                    error = { 'DiagnosticError', 'ErrorMsg', '#DC2626' },
                    warning = { 'DiagnosticWarn', 'WarningMsg', '#FBBF24' },
                    info = { 'DiagnosticInfo', '#2563EB' },
                    hint = { 'DiagnosticHint', '#10B981' },
                    default = { 'Identifier', '#7C3AED' },
                    test = { 'Identifier', '#FF00FF' },
                },
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                keywords = {
                    SECURITY = {
                        icon = ' ', -- icon used for the sign, and in search results
                        color = 'error', -- can be a hex color, or a named color (see below)
                        alt = {
                            'SECURITY',
                            'SEC',
                        }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    FIX = {
                        icon = ' ', -- icon used for the sign, and in search results
                        color = 'error', -- can be a hex color, or a named color (see below)
                        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                        -- signs = false, -- configure signs for some keywords individually
                    },
                    TODO = {
                        icon = ' ',
                        color = 'info',
                    },
                    HACK = { icon = ' ', color = 'warning' },
                    WARN = {
                        icon = ' ',
                        color = 'warning',
                        alt = { 'WARNING', 'XXX' },
                    },
                    PERF = {
                        icon = ' ',
                        alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' },
                    },
                    IMP = {
                        icon = '❗',
                        color = 'error',
                        alt = { 'IMPORTANT' },
                    },
                    NOTE = {
                        icon = ' ',
                        color = 'hint',
                        alt = { 'INFO' },
                    },
                    CURRENT = {
                        icon = ' ',
                        color = 'warning',
                        alt = { 'NOW' },
                    },
                    USERINPUT = {
                        icon = '❗',
                        color = 'error',
                        alt = { 'INPUT' },
                    },
                    VULNERABILITY = {
                        icon = '❗',
                        color = 'error',
                        alt = { 'VULN' },
                    },
                    TEST = {
                        icon = '⏲ ',
                        color = 'test',
                        alt = { 'TESTING', 'PASSED', 'FAILED' },
                    },
                },
            })
        end,

        vim.keymap.set(
            'n',
            '<leader>sa',
            '<cmd>TodoTelescope<cr>',
            { desc = 'Todo Telescope' }
        ),
    },
}
