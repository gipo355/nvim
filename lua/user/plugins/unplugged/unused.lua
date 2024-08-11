return {
    -- not needed, terraformls + treesitter
    { 'hashivim/vim-terraform' },

    -- alternative to mini_misc.setup_restore_cursor
    -- restores cursor position
    { 'farmergreg/vim-lastplace' },

    -- not needed anymore, conflicts wit builtin treesitter
    {
        'wuelnerdotexe/vim-astro',
        config = function()
            vim.g.astro_typescript = 'enable'
        end,
    },

    -- replace telescope buffer picker, removed to use telescope recent files cwd
    {
        'dzfrias/arena.nvim',
        event = 'BufWinEnter',
        -- Calls `.setup()` automatically
        keys = {
            -- keymap
            {
                -- '<leader>f',
                '<C-j>',
                "<cmd>lua require('arena').toggle()<cr>",
                'n',
                desc = 'Arena picker',
            },
        },
        config = function()
            require('arena').setup({
                per_project = false,
                max_items = 9,
                ignore_current = false,
                keybinds = {
                    ['j'] = function()
                        local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
                        if line == vim.api.nvim_buf_line_count(0) then
                            vim.fn.cursor(1, 0)
                        else
                            vim.fn.cursor(line + 1, 0)
                        end
                    end,
                    ['k'] = function()
                        local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
                        if line == 1 then
                            vim.fn.cursor(vim.api.nvim_buf_line_count(0), 0)
                        else
                            vim.fn.cursor(line - 1, 0)
                        end
                    end,
                },
            })
            -- lvim.builtin.which_key.mappings["k"] = { "<cmd>lua require('arena').toggle()<cr>", "Arena buffer picker" }
        end,
    },

    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },

    -- dev containers (devcontainer.json)
    -- either one
    -- { 'jamestthompson3/nvim-remote-containers' },
    {
        'https://codeberg.org/esensar/nvim-dev-container',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        opts = {},
    },

    {
        -- autosave
        'okuuva/auto-save.nvim',
        cmd = 'ASToggle', -- optional for lazy loading on command
        event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
        enabled = _G.user.autosave.enable,
        opts = {
            enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
            execution_message = {
                enabled = true,
                message = function() -- message to print on save
                    return (
                        'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S')
                    )
                end,
                dim = 0.18, -- dim the color of `message`
                cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
            },
            trigger_events = { -- See :h events
                immediate_save = { 'BufLeave', 'FocusLost' }, -- vim events that trigger an immediate save
                defer_save = { 'InsertLeave', 'TextChanged' }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
                cancel_defered_save = { 'InsertEnter' }, -- vim events that cancel a pending deferred save
            },
            -- function that takes the buffer handle and determines whether to save the current buffer or not
            -- return true: if buffer is ok to be saved
            -- return false: if it's not ok to be saved
            -- if set to `nil` then no specific condition is applied
            condition = nil,
            write_all_buffers = true, -- write all buffers when the current one meets `condition`
            noautocmd = false, -- do not execute autocmds when saving
            debounce_delay = 5000, -- delay after which a pending save is executed
            -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
            debug = false,
        },
    },

    -- monitor code time
    { 'wakatime/vim-wakatime' },

    -- Run code in nvim
    -- The task runner we use, overseer + compiler.nvim
    {
        'stevearc/overseer.nvim',
        -- commit = '400e762648b70397d0d315e5acaf0ff3597f2d8b',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
        opts = {
            task_list = {
                direction = 'bottom',
                min_height = 25,
                max_height = 25,
                default_detail = 1,
            },
        },
    },
    {
        'Zeioth/compiler.nvim',
        cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
        dependencies = {
            {
                'stevearc/overseer.nvim',
                init = function()
                    require('overseer').setup()
                end,
            },
        },
        opts = {},
        init = function()
            vim.api.nvim_buf_set_keymap(
                0,
                'n',
                '<F6>',
                '<cmd>CompilerOpen<cr>',
                set_desc('open compiler')
            )

            vim.keymap.set(
                'n',
                '<leader>Mt',
                '<cmd>CompilerToggleResults<cr>',
                set_desc('toggle compiler results')
            )

            vim.keymap.set(
                'n',
                '<leader>Mo',
                '<cmd>CompilerOpen<cr>',
                set_desc('open compiler')
            )
            vim.keymap.set(
                'n',
                '<leader>Mr',
                '<cmd>CompilerRedo<cr>',
                set_desc('compiler redo')
            )

            vim.keymap.set(
                'n',
                '<leader>Mc',
                '<cmd>OverseerRun<cr>',
                set_desc('run overseer')
            )
        end,
    },

    -- # surround, conflicts with mini.surround
    -- also conflicts with flash.nvim (ds is jump)
    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    },

    -- highlight colors in css, html, lua, svelte, markdown, vue, typescript, javascript, javascriptreact, typescriptreact
    -- better alternative is highlight-colors
    {
        'norcalli/nvim-colorizer.lua', -- alternative to nvim-highlight-colors
        config = function()
            require('colorizer').setup({
                'css',
                'scss',
                'html',
                'lua',
                'svelte',
                'markdown',
                'vue',
                'typescript',
                'javascript',
                'javascriptreact',
                'typescriptreact',
                html = {
                    mode = 'foreground',
                },
            })
        end,
    },

    -- highlight word under cursor, similar to illuminate or mini.cursorword
    -- using mini.cursorword
    {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup({
                -- file_types = { 'python', 'cpp' }, -- If this is given only attach to this
                -- OR attach to every filetype except:
                -- disable_file_types = { 'tex' },
                -- hlgroup = 'Search',
                hlgroup = 'CursorLine',
                cw_hlgroup = nil,
                -- Whether to display highlights in INSERT mode or not
                insert_mode = true,
                min_match_len = 3,
                max_match_len = math.huge,
            })
        end,
    },

    'ThePrimeagen/harpoon',

    -- doesn't work
    {
        'mawkler/modicator.nvim', -- color line number with insert mode
        dependencies = {
            -- Add your colorscheme plugin here
            'mawkler/onedark.nvim',
            'sainnhe/sonokai',
        },
        opts = {
            show_warnings = false,
        },
        init = function()
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
    },

    { -- splitjoin, using mini splitjoin
        'Wansmer/treesj', -- split join code
        dependencies = { 'nvim-treesitter' },
        keys = {
            {
                '<leader>n',
                '<cmd>TSJToggle<cr>',
                'n',
                desc = 'join/split',
            },
        },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
            })
        end,
    },

    { -- using mini.map
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
        end,
    },

    {
        'jinh0/eyeliner.nvim',
        config = function()
            require('eyeliner').setup({
                highlight_on_key = true,
                dim = false,
            })
        end,
    },

    { 'psliwka/vim-smoothie' },

    -- hop plugin (use flash)
    {
        'phaazon/hop.nvim',
        event = 'BufReadPre',
        config = function()
            require('hop').setup()
            -- mappings in user.mappings
        end,
    },

    -- argumnts sytnax highlighter
    {
        'm-demare/hlargs.nvim',
        config = function()
            require('hlargs').setup({
                -- color = '#0d9488',
                paint_arg_usages = false,
                paint_catch_blocks = {
                    declarations = true,
                    usages = false,
                },
            })
        end,
    },

    -- paste images into markdown with :PasteImg, alternative to img-clip
    {
        'postfen/clipboard-image.nvim',
        -- 'ekickx/clipboard-image.nvim',
        config = function()
            lvim.builtin.which_key.mappings['h']['p'] =
                { '<cmd>PasteImg<cr>', 'Paste image' }

            require('clipboard-image').setup({
                default = {
                    img_dir = { '%:p:h', 'img' },
                    -- img_dir_txt = function()
                    --     return { vim.fn["percent#encode"](vim.fn.expand("%:p:h")), "img" }
                    -- end,
                    affix = '![](%s)',
                },
                -- img_handler = function(img)
                --     vim.cmd("normal! f[")            -- go to [
                --     vim.cmd("normal! a" .. img.name) -- append text with image name
                -- end
            })
        end,
    },

    {
        'm4xshen/hardtime.nvim',
        event = 'VeryLazy',
        opts = {},
        config = function()
            require('hardtime').setup({
                disabled_mouse = false,
                restriction_mode = 'hint',
            })
        end,
    },

    {
        'Wansmer/symbol-usage.nvim', -- display symbol usage references and implementations
        event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
        config = function()
            require('symbol-usage').setup()
        end,
    },

    {
        'luckasRanarison/clear-action.nvim', -- comment out a mapping in mappings.lua
        event = 'BufReadPre',
        opts = {
            signs = {
                enable = true,
                timeout = 100, -- in milliseconds
                combine = false, -- combines all action kinds into a single sign
                position = 'eol', -- "right_align" | "overlay"
                separator = ' ', -- signs separator
                show_count = true, -- show the number of each action kind
                show_label = true, -- show the string returned by `label_fmt`
                label_fmt = function(actions)
                    return actions[1].title
                end, -- actions is an array of `CodeAction`
                update_on_insert = false, -- show and update signs in insert mode
                icons = {
                    quickfix = '🔧',
                    refactor = '💡',
                    source = '🔗',
                    combined = '💡', -- used when combine is set to true
                },
                highlights = { -- highlight groups
                    quickfix = 'Comment',
                    refactor = 'Comment',
                    source = 'Comment',
                    combined = 'Comment',
                    label = 'Comment',
                },
            },
            mappings = {
                -- The values can either be a string or a string tuple (with description)
                -- example: "<leader>aq" | { "<leader>aq", "Quickfix" }
                apply_first = nil, -- directly applies the first code action
                -- These are just basically `vim.lsp.buf.code_action` with the `apply` option with some filters
                -- If there's only one code action, it gets automatically applied.
                quickfix = { '<leader>af', 'Quickfix' },
                quickfix_next = { '<leader>an', 'Quickfix next' },
                quickfix_prev = { '<leader>ap', 'Quickfix prev' },
                refactor = { '<leader>ar', 'Refactor' },
                refactor_inline = { '<leader>aR', 'Refactor inline' },
                refactor_extract = { '<leader>ax', 'Refactor inline' },
                refactor_rewrite = { '<leader>aX', 'Refactor inline' },
                source = { '<leader>as', 'Refactor source' },
                -- server-specific mappings, server_name = {...}
                -- This is a map of code actions prefixes and keys
                actions = {
                    -- example:
                    -- ["rust_analyzer"] = {
                    --   ["Inline"] = "<leader>ai"
                    --   ["Add braces"] = { "<leader>ab", "Add braces" }
                    -- }
                },
            },
            -- This is used for filtering actions in the quickfix functions
            -- It's a map of diagnostic codes and the preferred action prefixes
            -- You can check the diagnostic codes by hovering on the diagnostic
            quickfix_filters = {
                -- example:
                -- ["rust_analyzer"] = {
                --   ["E0433"] = "Import",
                -- },
                -- ["lua_ls"] = {
                --   ["unused-local"] = "Disable diagnostics on this line",
                -- },
            },
        },
    },

    { -- alternative to session
        'jedrzejboczar/possession.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    },

    {
        -- must install server with :OmniSharpInstall
        'OmniSharp/omnisharp-vim',
        config = function()
            vim.g.OmniSharp_server_use_net6 = 1
        end,
        dependencies = {
            'tpope/vim-dispatch',
            'Shougo/vimproc.vim',
        },
    },

    -- twilight, hide useless block code ( for zen mode
    {
        'folke/twilight.nvim',
        config = function()
            require('twilight').setup({
                context = 25, -- amount of lines we will try to show around the current line
            })
        end,
    },

    -- code action menu as for [https://www.reddit.com/r/neovim/comments/qe3r3g/lspsaga_alternative/]
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        init = function()
            vim.g.code_action_menu_show_diff = true
        end,
    },

    -- blur unused variables, not needed its builtin
    {
        'zbirenbaum/neodim',
        event = 'LspAttach',
        config = function()
            require('neodim').setup({
                -- refresh_delay = 75,
                -- alpha = 0.75,
                -- blend_color = "#000000",
                -- hide = {
                --     underline = true,
                --     virtual_text = true,
                --     signs = true,
                -- },
                -- regex = {
                --     "[uU]nused",
                --     "[nN]ever [rR]ead",
                --     "[nN]ot [rR]ead",
                -- },
                -- priority = 128,
                -- disable = {},
            })
        end,
    },
    -- better formatting on save
    {
        'lukas-reineke/lsp-format.nvim',
        -- config = function()
        --     require("lsp-format").setup()
        -- end,
    },
    {
        -- override web devicons
        'yamatsum/nvim-nonicons',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-nonicons').setup()
        end,
    },
    {
        'gipo355/nvim-material-icon',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            local web_devicons_ok, web_devicons =
                pcall(require, 'nvim-web-devicons')
            if not web_devicons_ok then
                return
            end

            local material_icon_ok, material_icon =
                pcall(require, 'nvim-material-icon')
            if not material_icon_ok then
                return
            end

            web_devicons.setup({
                override = material_icon.get_icons(),
            })
        end,
    },
}
