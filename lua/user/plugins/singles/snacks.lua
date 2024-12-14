local set_desc = require('user.utils.functions').set_keymap_desc
-- utils for many things, can replace stuff
return {
    'folke/snacks.nvim',
    enabled = _G.user.additional_plugins.snacks,
    priority = 1000,
    lazy = false,
    config = function()
        local snacks = require('snacks')
        snacks.setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true }, -- replaces bigfile
            quickfile = { enabled = true },
            bufdelete = { enabled = true }, -- replaces mappings

            input = { enabled = false },
            indent = { enabled = false }, -- replaces indent_blankline
            notifier = { enabled = true },
            notify = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = false },
            zen = { enabled = false },
            animate = { enabled = false },
            debug = { enabled = false },
            dim = { enabled = false },
            git = { enabled = false },
            gitbrowse = { enabled = false },
            lazygit = { enabled = false },
            profiler = { enabled = false },
            scope = { enabled = false },
            rename = { enabled = false },
            scratch = { enabled = false },
            terminal = { enabled = false },
            toggle = { enabled = false },
            win = { enabled = false },

            -- github dashboard
            -- dashboard = {
            --     sections = {
            --         { section = 'header' },
            --         -- {
            --         --     pane = 2,
            --         --     section = 'terminal',
            --         --     cmd = 'colorscript -e square',
            --         --     height = 5,
            --         --     padding = 1,
            --         -- },
            --         { section = 'keys', gap = 1, padding = 1 },
            --         {
            --             pane = 2,
            --             icon = ' ',
            --             desc = 'Browse Repo',
            --             padding = 1,
            --             key = 'b',
            --             action = function()
            --                 snacks.gitbrowse()
            --             end,
            --         },
            --         function()
            --             local in_git = snacks.git.get_root() ~= nil
            --             local cmds = {
            --                 {
            --                     title = 'Notifications',
            --                     cmd = 'gh notify -s -a -n5',
            --                     action = function()
            --                         vim.ui.open(
            --                             'https://github.com/notifications'
            --                         )
            --                     end,
            --                     key = 'n',
            --                     icon = ' ',
            --                     height = 5,
            --                     enabled = true,
            --                 },
            --                 {
            --                     title = 'Open Issues',
            --                     cmd = 'gh issue list -L 3',
            --                     key = 'i',
            --                     action = function()
            --                         vim.fn.jobstart(
            --                             'gh issue list --web',
            --                             { detach = true }
            --                         )
            --                     end,
            --                     icon = ' ',
            --                     height = 7,
            --                 },
            --                 {
            --                     icon = ' ',
            --                     title = 'Open PRs',
            --                     cmd = 'gh pr list -L 3',
            --                     key = 'p',
            --                     action = function()
            --                         vim.fn.jobstart(
            --                             'gh pr list --web',
            --                             { detach = true }
            --                         )
            --                     end,
            --                     height = 7,
            --                 },
            --                 {
            --                     icon = ' ',
            --                     title = 'Git Status',
            --                     cmd = 'hub --no-pager diff --stat -B -M -C',
            --                     height = 10,
            --                 },
            --             }
            --             return vim.tbl_map(function(cmd)
            --                 return vim.tbl_extend('force', {
            --                     pane = 2,
            --                     section = 'terminal',
            --                     enabled = in_git,
            --                     padding = 1,
            --                     ttl = 5 * 60,
            --                     indent = 3,
            --                 }, cmd)
            --             end, cmds)
            --         end,
            --         { section = 'startup' },
            --     },
            -- },

            -- simple dashboard
            dashboard = {
                sections = {
                    { section = 'header' },
                    -- {
                    --     pane = 2,
                    --     section = 'terminal',
                    --     cmd = 'colorscript -e square',
                    --     height = 5,
                    --     padding = 1,
                    -- },
                    {
                        pane = 1,
                        section = 'keys',
                        gap = 1,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = ' ',
                        title = 'Recent Files',
                        section = 'recent_files',
                        indent = 2,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = ' ',
                        title = 'Projects',
                        section = 'projects',
                        indent = 2,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        icon = ' ',
                        title = 'Git Status',
                        section = 'terminal',
                        enabled = function()
                            return snacks.git.get_root() ~= nil
                        end,
                        cmd = 'hub status --short --branch --renames',
                        height = 5,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    {
                        pane = 2,
                        icon = ' ',
                        title = 'Git Log',
                        section = 'terminal',
                        enabled = function()
                            return snacks.git.get_root() ~= nil
                        end,
                        cmd = 'git log -5 --oneline',
                        height = 10,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    {
                        pane = 1,
                        icon = ' ',
                        title = 'Current Branch',
                        section = 'terminal',
                        enabled = function()
                            return snacks.git.get_root() ~= nil
                        end,
                        cmd = 'git rev-parse --abbrev-ref HEAD',
                        height = 1,
                        padding = 1,
                        ttl = 5 * 60,
                        indent = 3,
                    },
                    { section = 'startup' },
                },
            },
        })

        vim.keymap.set('n', '<leader>bB', function()
            snacks.bufdelete.other()
        end, set_desc('Close all other buffers'))

        vim.keymap.set('n', 'Q', function()
            snacks.bufdelete()
        end, set_desc('Destroy buffer'))
    end,
}
