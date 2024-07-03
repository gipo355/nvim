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

    -- easily move windows
    {
        'sindrets/winshift.nvim',
        event = 'BufWinEnter',
        config = function()
            require('winshift').setup()
            vim.keymap.set(
                'n',
                '<C-w>a',
                '<cmd>WinShift<cr>',
                set_desc('WinShiftLeft')
            )
        end,
    },

    { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'BufReadPre' },

    { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' },

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

    {
        'numToStr/Comment.nvim',
        event = 'BufReadPre',
        opts = {},
        config = function()
            -- vim.keymap.set(
            --     'n',
            --     '<M-/>',
            --     "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
            --     opts
            -- )
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>/',
                '<Plug>(comment_toggle_linewise_current)',
                set_desc('comment')
            )
            vim.keymap.set(
                { 'v' },
                '<leader>/',
                '<Plug>(comment_toggle_linewise_visual)',
                set_desc('comment')
            )
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
        enabled = _G.user.enable_satellite_scrollbar,
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
            leader_key = ';', -- Recommended to be a single key
            buffer_leader_key = 'ml', -- Per Buffer Mappings
            per_buffer_config = {
                satellite = { -- defualt to nil, display arrow index in scrollbar at every update
                    enable = _G.user.enable_satellite_scrollbar,
                    overlap = true,
                    priority = 1000,
                },
                -- treesitter_context = nil, -- it can be { line_shift_down = 2 }, currently not usable, for detail see https://github.com/otavioschwanck/arrow.nvim/pull/43#issue-2236320268
            },
        },
    },

    -- create beautiful images :Silicon
    {
        'segeljakt/vim-silicon',
        event = 'BufReadPre',
        -- TODO: why doesn't this set the key in visual mode?
        -- keys = {
        --     {
        --         '<leader>hs',
        --         ':Silicon<cr>',
        --         { 'n', 'v' },
        --         desc = 'Silicon',
        --     },
        -- },
        config = function()
            vim.keymap.set(
                'n',
                '<leader>hs',
                '<cmd>Silicon<cr>',
                set_desc('Take code snapshot')
            )
            vim.keymap.set(
                'v',
                '<leader>hs',
                ':Silicon<cr>',
                set_desc('Take visual code snapshot')
            )
        end,
    },

    -- caddyfile syntax
    { 'isobit/vim-caddyfile', event = 'BufReadPre Caddyfile' },

    -- multicursor
    -- this sets m-\ a-\ keybind \\\\\\
    { 'mg979/vim-visual-multi', event = 'BufReadPre' },

    {
        'barrett-ruth/live-server.nvim',
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
    { 'tpope/vim-sleuth', event = 'BufReadPre' },

    -- status column on right

    -- search and replace on steroids
    { 'dstein64/vim-startuptime', event = 'VimEnter' },

    {
        -- incremental selection with cr and backspace, can also use flash.nvim S
        'sustech-data/wildfire.nvim',
        event = 'VeryLazy',
        -- dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require('wildfire').setup()
        end,
    },

    -- alternative to clipboard-image.nvim
    {
        'HakonHarnes/img-clip.nvim',
        event = 'BufEnter',
        config = function()
            require('img-clip').setup({
                -- add options here
                -- or leave it empty to use the default settings
                default = {
                    dir_path = 'assets/imgs/nvim', -- directory path to save images to, can be relative (cwd or current file) or absolute
                    url_encode_path = true, --
                },
            })
            vim.keymap.set(
                'n',
                '<leader>hp',
                '<cmd>PasteImage<cr>',
                set_desc('paste image')
            )
        end,
    },

    -- preview markdown with :MarkdownPreview :MarkdownPreviewStop ( in browser )
    {
        'iamcco/markdown-preview.nvim',
        event = 'BufReadPre',
        keys = {
            {
                '<leader>hm',
                '<cmd>MarkdownPreviewToggle<cr>',
                'n',
                desc = 'Markdown preview',
            },
        },
        cmd = {
            'MarkdownPreviewToggle',
            'MarkdownPreview',
            'MarkdownPreviewStop',
        },
        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { 'markdown' },
    },

    {
        'MattesGroeger/vim-bookmarks',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>Bd',
                '<cmd>BookmarkClear<cr>',
                'n',
                desc = 'Clear bookmark',
            },
            {
                '<leader>BD',
                '<cmd>BookmarkClearAll<cr>',
                'n',
                desc = 'Clear all bookmark',
            },
            {
                '<leader>Ba',
                '<cmd>BookmarkToggle<cr>',
                'n',
                desc = 'Bookmark toggle',
            },
            {
                '<leader>Bt',
                '<cmd>BookmarkAnnotate<cr>',
                'n',
                desc = 'Bookmark annotate',
            },
            {
                '<leader>Bv',
                '<cmd>BookmarkShowAll<cr>',
                'n',
                desc = 'Show all bookmark',
            },
            {
                '<leader>BT',
                '<cmd>TodoTelescope<cr>',
                'n',
                desc = 'Todo Telescope',
            },
        },
        config = function()
            -- highlight BookmarkSign ctermbg=NONE ctermfg=160
            -- highlight BookmarkLine ctermbg=194 ctermfg=NONE
            -- local icons = require "user.icons"
            vim.g.bookmark_sign = ''
            vim.g.bookmark_annotation_sign = ''
            vim.g.bookmark_no_default_key_mappings = 1
            vim.g.bookmark_auto_close = 0
            vim.g.bookmark_manage_per_buffer = 0
            vim.g.bookmark_save_per_working_dir = 0
            -- vim.g.bookmark_highlight_lines = 1
            vim.g.bookmark_show_warning = 0
            vim.g.bookmark_center = 1
            vim.g.bookmark_location_list = 0
            vim.g.bookmark_disable_ctrlp = 1
            vim.g.bookmark_display_annotation = 0
            -- vim.g.bookmark_auto_save_file = '~/.config/lvim/bookmarks'
            vim.g.bookmark_auto_save = 0
        end,
    },

    {
        'mbbill/undotree',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set(
                'n',
                '<leader>u',
                '<cmd>UndotreeToggle<cr>',
                { desc = 'undo tree' }
            )
        end,
    },

    -- # better % navigation - BUGGED for now treesitter 2024-03-08
    {
        'andymass/vim-matchup', -- improved % jumping, activate on treesitter
        event = 'BufReadPre',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        lazy = false,
        -- commit = '55e3330436784fb8ccc35a5cfeb13e48bab9dcd2',
        -- version = '0.7.2'
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = 'popup' }
            -- vim.g.matchup_matchparen_offscreen = { method = 'popup', fullwidth = 1, syntax_hl = 1 }
        end,
    },

    { 'nvim-treesitter/playground', event = 'BufEnter' },

    {
        'windwp/nvim-ts-autotag',
        event = 'BufReadPre',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-ts-autotag').setup({
                aliases = {
                    ['angular.html'] = 'html',
                },
                opts = {
                    -- Defaults
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = false, -- Auto close on trailing </
                },
                -- filetypes = {
                --     'html',
                --     'javascript',
                --     'typescript',
                --     'javascriptreact',
                --     'typescriptreact',
                --     'svelte',
                --     'vue',
                --     'tsx',
                --     'jsx',
                --     'rescript',
                --     'xml',
                --     'php',
                --     'markdown',
                --     'astro',
                --     'glimmer',
                --     'handlebars',
                --     'hbs',
                --     'angular.html',
                --     'templ',
                -- },
            })
        end,
    },

    { 'bennypowers/nvim-regexplainer', event = 'BufReadPre' },

    {
        'lambdalisue/suda.vim',
        event = 'BufReadPre',
        config = function()
            -- vim.g.suda_smart_edit = 1
        end,
    },

    { 'digitaltoad/vim-pug', ft = '*.pug' },

    {
        'ellisonleao/glow.nvim',
        event = 'BufReadPre',
        keys = {
            {
                '<leader>hg',
                '<cmd>Glow<cr>',
                'n',
                desc = 'Glow markdown',
            },
        },
        cmd = 'Glow',
        config = function()
            require('glow').setup({
                width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
                height_ratio = 0.9,
            })
        end,
    },

    {
        'ThePrimeagen/refactoring.nvim',
        event = 'BufReadPre',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
        },
        config = function()
            vim.keymap.set(
                { 'v', 'n' },
                '<C-x>',
                ':lua require("refactoring").select_refactor()<cr>',
                set_desc('Primeagen refactor')
            )
            require('refactoring').setup()
        end,
    },

    {
        'kkoomen/vim-doge',
        event = 'BufReadPre',
        build = ':call doge#install()',
        keys = {
            {
                '<leader>vG',
                '<cmd>DogeGenerate<cr>',
                'n',
                desc = 'generate type docs',
            },
        },
        config = function()
            vim.g.doge_enable_mappings = 0
            vim.g.doge_javascript_settings = {
                destructuring_props = 0,
                omit_redunant_param_types = 1,
            }
        end,
    },

    {
        'cbochs/portal.nvim',
        keys = {
            {
                '<leader>o',
                '<cmd>Portal jumplist backward<cr>',
                'n',
                desc = 'Portal jumplist backward',
            },
            {
                '<leader>i',
                '<cmd>Portal jumplist forward<cr>',
                'n',
                desc = 'Portal jumplist forward',
            },
        },
        -- Optional dependencies
        dependencies = { 'cbochs/grapple.nvim' },
        opts = {},
    },

    {
        'folke/zen-mode.nvim',
        keys = {
            {
                '<s-z>',
                '<cmd>ZenMode<cr>',
                { 'n', 'x', 'v' },
                desc = 'Zen mode',
            },
        },
        config = function()
            require('zen-mode').setup({
                window = {
                    width = 100,
                },
                -- plugins = {
                --     tmux = { enabled = true },
                --     wezterm = {
                --         enabled = true,
                --         font = '17'
                --     }
                -- },
            })
            -- ######## zen mode plugin
            -- vim.keymap.set({ 'n', 'x', 'v' }, '<s-z>', '<cmd>ZenMode<cr>', opts) -- bbye plugin
        end,
    },
}
