-- TODO: ftplugin
-- TODO: split this up
local icons = require('user.utils.icons')
local set_desc = require('user.utils.functions').set_keymap_desc
local merge_tables = require('user.utils.functions').merge_tables
local opts = require('user.utils.options').global_keymap_opts

return {
    { -- Collection of various small independent plugins/modules
        -- Examples:
        -- vip followed by gh / gH applies/resets hunks inside current paragraph. Same can be achieved in operator form ghip / gHip, which has the advantage of being dot-repeatable.
        -- gh_ / gH_ applies/resets current line (even if it is not a full hunk).
        -- ghgh / gHgh applies/resets hunk range under cursor.
        -- dgh deletes hunk range under cursor.
        -- [H / [h / ]h / ]H navigate cursor to the first / previous / next / last hunk range of the current buffer.
        'echasnovski/mini.nvim',
        version = false,
        event = 'VeryLazy',
        config = function()
            -- BUG: neovim crash possibly?

            -- Another git signs plugin
            -- local mini_diff = require('mini.diff')
            -- mini_diff.setup({
            --     -- Options for how hunks are visualized
            --     view = {
            --         -- Visualization style. Possible values are 'sign' and 'number'.
            --         style = vim.o.number and 'number' or 'sign',
            --         -- Signs used for hunks with 'sign' view
            --         signs = { add = '▒', change = '▒', delete = '▒' },
            --         -- Priority of used visualization extmarks
            --         priority = vim.highlight.priorities.user - 1,
            --     },
            --     -- Source for how reference text is computed/updated/etc
            --     -- Uses content from Git index by default
            --     source = nil,
            --     -- Delays (in ms) defining asynchronous processes
            --     delay = {
            --         -- How much to wait before update following every text change
            --         text_change = 200,
            --     },
            --     -- Module mappings. Use `''` (empty string) to disable one.
            --     mappings = {
            --         -- Apply hunks inside a visual/operator region
            --         apply = 'gh',
            --         -- Reset hunks inside a visual/operator region
            --         reset = 'gH',
            --         -- Hunk range textobject to be used inside operator
            --         textobject = 'gh',
            --         -- Go to hunk range in corresponding direction
            --         goto_first = '[H',
            --         goto_prev = '[h',
            --         goto_next = ']h',
            --         goto_last = ']H',
            --     },
            --     -- Various options
            --     options = {
            --         -- Diff algorithm. See `:h vim.diff()`.
            --         algorithm = 'histogram',
            --         -- Whether to use "indent heuristic". See `:h vim.diff()`.
            --         indent_heuristic = true,
            --         -- The amount of second-stage diff to align lines (in Neovim>=0.9)
            --         linematch = 60,
            --     },
            -- })
            -- vim.keymap.set(
            --     'n',
            --     '<leader>ge',
            --     '<cmd>lua require("mini.diff").toggle_overlay()<CR>',
            --     set_desc('MiniDiff toggle overlay')
            -- )

            -- set of useful functions
            -- interesting read: [https://www.reddit.com/r/neovim/comments/zy5s0l/you_dont_need_vimrooter_usually_or_how_to_set_up/]
            local mini_misc = require('mini.misc')
            mini_misc.setup()

            -- alternative to vim-rooter, autoroot (using rooter as i can manully set root)
            -- mini_misc.setup_auto_root(_G.user.root_patterns)
            vim.keymap.set(
                'n',
                '<leader>a',
                -- command to trigger auto rooter
                function()
                    local root_dir =
                        mini_misc.find_root(0, _G.user.root_patterns)
                    -- vim.fn.chdir(root_dir)
                    -- local cmd_string = '<cmd>tcd ' .. root_dir .. '<CR>'
                    -- local cmd_string = '<cmd>cd ' .. root_dir .. '<CR>'

                    vim.cmd('tcd ' .. root_dir)
                    print('Tcd to: ' .. root_dir)
                    -- return cmd_string
                end,
                -- '<Cmd>lua require("mini.misc").find_root(0, { _G.user.root_patterns })<CR>',
                set_desc('cd to root')
            )

            -- restore cursor position
            mini_misc.setup_restore_cursor()

            -- using shatur neovim-session-manager instead
            -- require('mini.sessions').setup({
            --     autoread = true,
            --     autowrite = true,
            -- })

            -- indentline for current scope, not needed(indent-blankline does it)
            if _G.user.enable_mini_indentscope then
                local mini_indent = require('mini.indentscope')
                mini_indent.setup({
                    draw = {
                        delay = 50,
                        animation = mini_indent.gen_animation.none(),
                        -- animation = mini_indent.gen_animation.linear({
                        --     easing = 'in',
                        --     duration = 100,
                        --     unit = 'total',
                        -- }),
                    },
                    symbol = icons.ui.LineLeft,
                })
            end

            -- Better Around/Inside textobjects
            if _G.user.animate_scroll then
                -- see https://www.lazyvim.org/extras/ui/mini-animate
                local animate = require('mini.animate')
                -- linear, quadratic, cubic, quartic, exponential
                animate.setup({
                    scroll = {
                        timing = animate.gen_timing.exponential({
                            duration = 65,
                            unit = 'total',
                        }),
                        -- timing = animate.gen_timing
                    },
                    resize = {
                        timing = animate.gen_timing.exponential({
                            duration = 75,
                            unit = 'total',
                        }),
                    },
                    cursor = {
                        timing = animate.gen_timing.exponential({
                            duration = 75,
                            unit = 'total',
                        }),
                    },
                    open = {
                        timing = animate.gen_timing.exponential({
                            duration = 75,
                            unit = 'total',
                        }),
                    },
                    close = {
                        timing = animate.gen_timing.exponential({
                            duration = 75,
                            unit = 'total',
                        }),
                    },
                })
                vim.keymap.set(
                    'n',
                    '<C-u>',
                    "<Cmd>lua vim.cmd('normal! <C-u>'); MiniAnimate.execute_after('scroll', 'normal! <C-u>zz')<CR>",
                    set_desc('Center cursor after c-u')
                )
                vim.keymap.set(
                    'n',
                    '<C-d>',
                    "<Cmd>lua vim.cmd('normal! <C-d>'); MiniAnimate.execute_after('scroll', 'normal! <C-d>zz')<CR>",
                    set_desc('Center cursor after c-u')
                )
                vim.keymap.set(
                    'n',
                    'n',
                    "<Cmd>lua vim.cmd('normal! n'); MiniAnimate.execute_after('scroll', 'normal! nzzzv')<CR>",
                    set_desc('Center cursor after c-u')
                )
                vim.keymap.set(
                    'n',
                    'N',
                    "<Cmd>lua vim.cmd('normal! N'); MiniAnimate.execute_after('scroll', 'normal! Nzzzv')<CR>",
                    set_desc('Center cursor after c-u')
                )
            else
                -- if animate_scroll is false

                vim.keymap.set(
                    'n',
                    '*',
                    '*zz',
                    set_desc('Search for word under cursor up')
                )
                vim.keymap.set(
                    'n',
                    '#',
                    '#zz',
                    set_desc('Search for word under cursor down')
                )
                vim.keymap.set(
                    'n',
                    'g*',
                    'g*zz',
                    set_desc('Search for word under cursor up')
                )
                vim.keymap.set(
                    'n',
                    'g#',
                    'g#zz',
                    set_desc('Search for word under cursor down')
                )

                -- better up/down
                vim.keymap.set(
                    { 'n', 'x' },
                    'j',
                    "v:count == 0 ? 'gj' : 'j'",
                    merge_tables(opts, { expr = true, desc = 'Move down' })
                )
                vim.keymap.set(
                    { 'n', 'x' },
                    'k',
                    "v:count == 0 ? 'gk' : 'k'",
                    merge_tables(opts, { expr = true, desc = 'Move up' })
                )
                -- center after n and N
                vim.keymap.set('n', 'n', 'nzzzv', set_desc('Center after n'))
                vim.keymap.set('n', 'N', 'Nzzzv', set_desc('Center after N'))
                -- ## go up down more lines with c-y c-e
                vim.keymap.set(
                    'n',
                    '<C-y>',
                    '3<C-y>',
                    set_desc('Scroll up 3 lines')
                )
                vim.keymap.set(
                    'n',
                    '<C-e>',
                    '3<C-e>',
                    set_desc('Scroll down 3 lines')
                )

                -- ## center cursor after c-d and c-u
                -- BUG: when reaching end of file or top it stutters

                -- vim.keymap.set(
                --     'n',
                --     '<C-u>',
                --     '<C-u>zz',
                --     set_desc('Center cursor after c-u')
                -- )
                -- vim.keymap.set(
                --     'n',
                --     '<C-d>',
                --     '<C-d>zz',
                --     set_desc('Center cursor after c-d')
                -- )
            end
            -- require('mini.jump').setup()

            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [']quote
            --  - ci'  - [C]hange [I]nside [']quote
            require('mini.ai').setup({ n_lines = 500 })

            require('mini.fuzzy').setup()

            -- alternative to lsp_signature.nvim
            if _G.user.mini_completion_lsp_signature then
                require('mini.completion').setup({
                    window = {
                        signature = {
                            border = 'single',
                        },
                    },
                    delay = {
                        -- Delay before completion is triggered, we only want signatures
                        -- cmp is handling completion
                        completion = 10 ^ 7,
                    },
                    -- lsp_completion = {},
                })
            end

            if _G.user.use_mini_colors_customization then
                require('mini.colors').setup()
            end

            -- use  local-highlight.nvim (faster), same as illuminate
            require('mini.cursorword').setup() -- highlight word under cursor

            if _G.user.enable_minimap then
                local minimap = require('mini.map')
                minimap.setup({
                    integrations = {
                        minimap.gen_integration.builtin_search(),
                        minimap.gen_integration.gitsigns(),
                        minimap.gen_integration.diagnostic(),
                    },
                    symbols = {
                        encode = minimap.gen_encode_symbols.dot('4x2'),
                    },
                    window = {
                        width = _G.user.minimap_width,
                        winblend = _G.user.minimap_winblend,
                        side = 'left',
                    },
                }) -- lua Mini
                vim.api.nvim_create_autocmd('BufEnter', {
                    callback = function()
                        vim.cmd('lua MiniMap.open()')
                    end,
                })
                vim.keymap.set(
                    'n',
                    '<leader>Bm',
                    '<Cmd>lua MiniMap.toggle()<CR>',
                    set_desc('toggle minimap')
                )
            end

            require('mini.splitjoin').setup()
            vim.keymap.set(
                'n',
                '<leader>n',
                '<Cmd>lua MiniSplitjoin.toggle()<CR>',
                set_desc('SplitJoin lines')
            )

            -- replaces oil.nvim
            require('mini.files').setup()
            -- vim.keymap.set('n', '<leader>-', function()
            vim.keymap.set('n', '<leader>R', function()
                require('mini.files').open()
            end, set_desc('mini.files open'))

            --[[
            surround, adds keymaps to s, lags flash.nvim, conflicts with nvim-surround 
            and flash.nvim
            ]]
            --
            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            require('mini.surround').setup()

            -- Simple and easy statusline.
            --  You could remove this setup call if you don't like it,
            --  and try some other statusline plugin
            -- local statusline = require('mini.statusline')
            -- set use_icons to true if you have a Nerd Font
            -- statusline.setup({ use_icons = _G.user.have_nerd_font })

            -- You can configure sections in the statusline by overriding their
            -- default behavior. For example, here we set the section for
            -- cursor location to LINE:COLUMN
            ---@diagnostic disable-next-line: duplicate-set-field
            -- statusline.section_location = function()
            --     return '%2l:%-2v'
            -- end

            -- ... and there is more!
            --  Check out: https://github.com/echasnovski/mini.nvim
        end,
    },
}
