-- TODO: move shared with vscode in its own group?
-- TODO: remove some plugins to clear up
-- TODO: refactor code, remove useless comments
-- TODO: fix imports and standardize them
-- TODO: improve docs, add exes
local utils = require('user.utils.functions')
local set_desc = utils.set_keymap_desc
local opts = require('user.utils.options').global_keymap_opts

-- TODO: add lunarvim, lazyvim defaults

-- TODO: clear some unused

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

    { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufReadPre' },

    -- disable feats if file is big
    {
        -- bigfile
        'LunarVim/bigfile.nvim',
        opts = {},
        event = 'VimEnter',
    },

    -- show function context above
    {
        'nvim-treesitter/nvim-treesitter-context',
        enabled = _G.user.treesitter_context.enable,
        event = 'BufReadPre',
        config = function()
            require('treesitter-context').setup({
                max_lines = _G.user.treesitter_context.max_lines,
                line_numbers = true,
                multiline_threshold = _G.user.treesitter_context.multiline_threshold,
                trim_scope = 'outer', -- inner or outer
            })
        end,
    },

    -- bufsurf, go back and forth history buffer (improved c-^)
    {
        'ton/vim-bufsurf',

        event = 'BufReadPre',

        config = function()
            vim.keymap.set(
                'n',
                '<S-h>',
                '<cmd>BufSurfBack<cr>',
                set_desc('BufSurfBack')
            )
            vim.keymap.set(
                'n',
                '<S-l>',
                '<cmd>BufSurfForward<cr>',
                set_desc('BufSurfForward')
            )
        end,
    },

    {
        'moll/vim-bbye',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set(
                'n',
                'Q',
                '<cmd>Bdelete!<CR>',
                set_desc('Delete buffer')
            ) -- bbye plugin
        end,
    }, -- :Bdelete

    {
        'ThePrimeagen/git-worktree.nvim',
        event = 'VeryLazy',
        enabled = _G.user.additional_plugins.git_worktree,
        config = function()
            local worktree_ok, git_worktree = pcall(require, 'git-worktree')
            local telescope_ok, telescope = pcall(require, 'telescope')

            if not worktree_ok or not telescope_ok then
                return
            end

            pcall(telescope.load_extension('git_worktree'))

            git_worktree.on_tree_change(function(op, metadata)
                if op == git_worktree.Operations.Switch then
                    print(
                        'Switched from '
                            .. metadata.prev_path
                            .. ' to '
                            .. metadata.path
                    )
                end
            end)

            vim.keymap.set(
                'n',
                '<leader>sW',
                "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
                set_desc('create worktree')
            )

            vim.keymap.set(
                'n',
                '<leader>sj',
                "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
                set_desc('list worktrees')
            )
        end,
    },

    {
        -- scrollbar
        'lewis6991/satellite.nvim',
        event = 'BufReadPre',
        enabled = _G.user.satellite_scrollbar.enable,
        config = function()
            require('satellite').setup()
        end,
    },

    {
        -- better alternative to harpoon
        -- TODO: this frees up c-j and leader a
        'otavioschwanck/arrow.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'lewis6991/satellite.nvim',
        },
        event = 'BufReadPre',
        opts = {
            show_icons = true,
            leader_key = 'm;', -- Recommended to be a single key
            buffer_leader_key = 'ml', -- Per Buffer Mappings
            per_buffer_config = {
                satellite = { -- defualt to nil, display arrow index in scrollbar at every update
                    enable = _G.user.satellite_scrollbar.enable,
                    overlap = true,
                    priority = 1000,
                },
                -- treesitter_context = nil, -- it can be { line_shift_down = 2 }, currently not usable, for detail see https://github.com/otavioschwanck/arrow.nvim/pull/43#issue-2236320268
            },
        },
    },

    -- caddyfile syntax
    {
        'isobit/vim-caddyfile',
        event = 'BufReadPre Caddyfile',
        enabled = _G.user.additional_plugins.caddyfile,
    },

    {
        'barrett-ruth/live-server.nvim',
        enabled = _G.user.additional_plugins.live_server,
        config = true,
        keys = {
            {
                '<leader>hl',
                '<cmd>LiveServerToggle<cr>',
                'n',
                set_desc('Live server'),
            },
        },
    },

    -- auto indent width based on file
    {
        'tpope/vim-sleuth',
        event = 'BufReadPre',
    },

    -- status column on right

    -- search and replace on steroids
    {
        'dstein64/vim-startuptime',
        enabled = _G.user.additional_plugins.startuptime,
        event = 'VimEnter',
    },

    {
        'nvim-treesitter/playground',
        enabled = _G.user.additional_plugins.treesitter_playground,
        event = 'BufEnter',
    },

    {
        'bennypowers/nvim-regexplainer',
        event = 'BufReadPre',
    },

    {
        'digitaltoad/vim-pug',
        enabled = _G.user.additional_plugins.pug,
        ft = '*.pug',
    },
}
