local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'nvim-telescope/telescope-file-browser.nvim',
    event = 'VeryLazy',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
        -- NOTE: this is in the telescope file
        -- pcall(require('telescope').load_extension('file_browser'))

        vim.keymap.set(
            'n',
            '<C-f>',
            -- '<leader>f',
            -- "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({hidden = true, files=false, grouped=true, cwd=true})<cr>",
            function()
                require('telescope').extensions.file_browser.file_browser({
                    hidden = true,
                    files = false,
                    grouped = true,
                    cwd = true,
                    previewer = false,
                    sort_lastused = true,
                    select_buffer = true,
                })
            end,
            set_desc('[F]ile browser')
        )

        vim.keymap.set(
            'n',
            '<C-b>',
            -- '<leader>f',
            function()
                require('telescope').extensions.file_browser.file_browser({
                    hidden = true,
                    files = true,
                    path = vim.fn.expand('%:p:h'),
                    grouped = true,
                    previewer = false,
                    sort_lastused = true,
                    select_buffer = true,
                })
            end,
            set_desc('[F]ile browser')
        )

        -- add another gitmap for git files root as path
        vim.keymap.set('n', '<C-z>', function()
            require('telescope').extensions.file_browser.file_browser({
                hidden = true,
                files = false,
                -- path = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
                cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
                grouped = true,
                previewer = false,
                sort_lastused = true,
                select_buffer = true,
            })
        end, set_desc('Telescope File browser [G]it files'))
    end,
}
