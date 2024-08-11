local set_desc = require('user.utils.functions').set_keymap_desc
local icons = require('user.utils.icons')

-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',

        event = 'BufReadPre',

        config = function()
            local gitsigns = require('gitsigns')
            gitsigns.setup({
                current_line_blame = _G.user.gitsigns.current_line_blame,
            })
            -- gitsigns.setup({
            --     signs = {
            --         add = {
            --             -- hl = 'GitSignsAdd',
            --             text = icons.ui.BoldLineLeft,
            --             -- numhl = 'GitSignsAddNr',
            --             -- linehl = 'GitSignsAddLn',
            --         },
            --         change = {
            --             -- hl = 'GitSignsChange',
            --             text = icons.ui.BoldLineLeft,
            --             -- numhl = 'GitSignsChangeNr',
            --             -- linehl = 'GitSignsChangeLn',
            --         },
            --         delete = {
            --             -- hl = 'GitSignsDelete',
            --             text = icons.ui.Triangle,
            --             -- numhl = 'GitSignsDeleteNr',
            --             -- linehl = 'GitSignsDeleteLn',
            --         },
            --         topdelete = {
            --             -- hl = 'GitSignsDelete',
            --             text = icons.ui.Triangle,
            --             -- numhl = 'GitSignsDeleteNr',
            --             -- linehl = 'GitSignsDeleteLn',
            --         },
            --         changedelete = {
            --             -- hl = 'GitSignsChange',
            --             text = icons.ui.BoldLineLeft,
            --             -- numhl = 'GitSignsChangeNr',
            --             -- linehl = 'GitSignsChangeLn',
            --         },
            --     },
            --     signcolumn = true,
            --     numhl = true,
            --     linehl = false,
            --     word_diff = false,
            --     watch_gitdir = {
            --         interval = 1000,
            --         follow_files = true,
            --     },
            --     auto_attach = true,
            --     attach_to_untracked = false, -- changed
            --     -- git blame
            --     -- current_line_blame = vim.g.enable_gitblame, -- Toggle with `:Gitsigns toggle_current_line_blame`
            --     current_line_blame = _G.user.enable_gitblame, -- Toggle with `:Gitsigns toggle_current_line_blame`
            --     current_line_blame_opts = {
            --         virt_text = true,
            --         virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
            --         delay = 2000,
            --         ignore_whitespace = true,
            --     },
            --
            --     current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            --     sign_priority = 6,
            --     status_formatter = nil, -- Use default
            --     update_debounce = 200,
            --     max_file_length = 40000,
            --     preview_config = {
            --         -- Options passed to nvim_open_win
            --         border = 'rounded',
            --         style = 'minimal',
            --         relative = 'cursor',
            --         row = 0,
            --         col = 1,
            --     },
            --     -- yadm = { enable = false },
            --
            --     -- signs = {
            --     --     add = { text = '+' },
            --     --     change = { text = '~' },
            --     --     delete = { text = '_' },
            --     --     topdelete = { text = '‾' },
            --     --     changedelete = { text = '~' },
            --     -- },
            -- })

            vim.keymap.set(
                'n',
                '<leader>gj',
                '<cmd>lua require "gitsigns".next_hunk({navigation_message = false})<cr>',
                set_desc('Next Hunk')
            )
            -- TODO: not working keymaps
            vim.keymap.set(
                'n',
                '<leader>gk',
                '<cmd>lua require "gitsigns".prev_hunk({navigation_message = false})<cr>',
                set_desc('Prev Hunk')
            )
            vim.keymap.set(
                'n',
                '<leader>gl',
                '<cmd>lua require "gitsigns".blame_line()<cr>',
                set_desc('Blame')
            )
            vim.keymap.set(
                'n',
                '<leader>gB',
                '<cmd>lua require "gitsigns".blame()<cr>',
                set_desc('Blame')
            )
            vim.keymap.set(
                'n',
                '<leader>gp',
                '<cmd>lua require "gitsigns".preview_hunk()<cr>',
                set_desc('Preview Hunk')
            )
            vim.keymap.set(
                'n',
                '<leader>gr',
                '<cmd>lua require "gitsigns".reset_hunk()<cr>',
                set_desc('Reset Hunk')
            )
            vim.keymap.set(
                'n',
                '<leader>gR',
                '<cmd>lua require "gitsigns".reset_buffer()<cr>',
                set_desc('Reset Buffer')
            )
            vim.keymap.set(
                'n',
                '<leader>ga',
                '<cmd>lua require "gitsigns".stage_hunk()<cr>',
                set_desc('Stage Hunk')
            )

            vim.keymap.set(
                'n',
                '<leader>gu',
                '<cmd>lua require "gitsigns".undo_stage_hunk()<cr>',
                set_desc('Undo Stage Hunk')
            )

            vim.keymap.set(
                'n',
                '<leader>go',
                '<cmd>Telescope git_status<cr>',
                set_desc('Git Status')
            )

            vim.keymap.set(
                'n',
                '<leader>gb',
                '<cmd>Telescope git_branches<cr>',
                set_desc('Git Branches checkout')
            )

            -- TODO: add keybindings opts to everything like this
            vim.keymap.set(
                'n',
                '<leader>gcc',
                '<cmd>Telescope git_commits<cr>',
                set_desc('Checkout commit')
            )
            -- C = {
            --   "<cmd>Telescope git_bcommits<cr>",
            --   "Checkout commit(for current file)",
            -- },
            vim.keymap.set(
                'n',
                '<leader>gcC',
                '<cmd>Telescope git_bcommits<cr>',
                set_desc('Checkout commit (for current file)')
            )
            -- d = {
            --   "<cmd>Gitsigns diffthis HEAD<cr>",
            --   "Git Diff",
            -- },
            vim.keymap.set(
                'n',
                '<leader>gdd',
                '<cmd>Gitsigns diffthis HEAD<cr>',
                set_desc('Git Diff this')
            )
        end,
    },
}
