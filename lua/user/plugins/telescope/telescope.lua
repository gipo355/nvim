local set_desc = require('user.utils.functions').set_keymap_desc
-- NOTE: Plugins can specify dependencies.

-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

-- TODO: close buffers with c-d, telescope mappings

return {
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        -- branch = '0.1.x',
        version = false,
        dependencies = {
            { 'nvim-lua/plenary.nvim', lazy = true },
            { -- If encountering errors, see telescope-fzf-native README for install instructions
                'nvim-telescope/telescope-fzf-native.nvim',
                lazy = true,

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable('make') == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim', lazy = true },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            {
                'nvim-tree/nvim-web-devicons',
                enabled = _G.user.have_nerd_font,
                lazy = true,
            },
        },
        config = function()
            local _, actions = pcall(require, 'telescope.actions')

            local custom_functions =
                require('user.plugins.telescope.utils.functions')

            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of help_tags options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`

            require('telescope').setup({
                -- frecency

                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                defaults = {
                    prompt_prefix = '  ',

                    layout_strategie = 'flex',

                    selection_caret = '❯ ',

                    winblend = 10,

                    borderchars = {
                        '─',
                        '│',
                        '─',
                        '│',
                        '╭',
                        '╮',
                        '╯',
                        '╰',
                    },

                    layout_config = {
                        -- prompt_position = "top",
                        height = 0.8,
                        width = 0.8,
                        bottom_pane = {
                            height = 25,
                            preview_cutoff = 120,
                        },
                        center = {
                            height = 0.4,
                            preview_cutoff = 40,
                            width = 0.5,
                        },
                        cursor = {
                            preview_cutoff = 40,
                        },
                        horizontal = {
                            preview_cutoff = 120,
                            preview_width = 0.6,
                        },
                        vertical = {
                            preview_cutoff = 40,
                        },
                        flex = {
                            flip_columns = 150,
                        },
                    },

                    db_safe_mode = false,

                    -- ### truncate instead of smart: monorepo same filenames can't distinguish
                    path_display = {
                        -- 'shorten', 'absolute', 'smart' 'truncate', 'filename first'
                        -- 'filename_first',
                        -- 'shorten',
                        -- 'smart',
                        'truncate',
                    },

                    cache_picker = {
                        num_pickers = 100,
                        limit_entries = 1000,
                    },

                    file_ignore_patterns = {
                        'vendor/*',
                        'node_modules/',
                        '.cache/',
                        'tmp/',
                        '.snapshots/',
                        'Zeal',
                        '.asdf/',
                        '.vscode/',
                        '.pnpm$',

                        -- '.git*',

                        '%.git/',
                        '.cache/',
                        '%.o',
                        '%.a',
                        '%.out',
                        '%.class',
                        '%.pdf',
                        '%.mkv',
                        '%.mp4',
                        '%.zip',

                        -- '^.git$',
                        '%.jpg',
                        '%.jpeg',
                        '%.png',
                        '%.svg',
                        '%.otf',
                        '%.ttf',
                    },

                    -- vimgrep_arguments = {
                    --     'rg',
                    --     '--color=never',
                    --     '--no-heading',
                    --     '--with-filename',
                    --     '--line-number',
                    --     '--column',
                    --     '--smart-case',
                    --     '--hidden', -- thats the new thing
                    -- },

                    mappings = {
                        -- i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                        i = {
                            ['<C-h>'] = 'which_key',
                            -- ['<C-d>'] = actions.delete_buffer,
                            ['<C-d>'] = custom_functions.delete_files,
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-n>'] = actions.cycle_history_next,
                            ['<C-c>'] = actions.close,
                            ['<C-p>'] = actions.cycle_history_prev,
                            ['<C-f>'] = actions.to_fuzzy_refine,
                            ['<C-q>'] = function(...)
                                actions.smart_send_to_qflist(...)
                                actions.open_qflist(...)
                            end,
                        },

                        n = {
                            ['<c-j>'] = actions.move_selection_next,
                            ['dd'] = custom_functions.delete_files,
                            -- ['dd'] = actions.delete_buffer,
                            ['<C-c>'] = actions.close,
                            ['q'] = actions.close,
                            ['<C-k>'] = actions.move_selection_previous,
                            ['<C-n>'] = actions.cycle_history_next,
                            ['<C-p>'] = actions.cycle_history_prev,
                            ['<C-q>'] = function(...)
                                actions.smart_send_to_qflist(...)
                                actions.open_qflist(...)
                            end,
                        },
                    },

                    pickers = {
                        colorscheme = {
                            enable_preview = true,
                        },
                        live_grep = {
                            --@usage don't include the filename in the search results
                            only_sort_text = true,
                            additional_args = {
                                '--hidden',
                            },
                        },
                        grep_string = {
                            only_sort_text = true,
                            additional_args = {
                                '--hidden',
                            },
                        },
                        find_files = {
                            find_command = {
                                'fd',
                                '--type=f',
                                '--color=never',
                                '--ignore-case',
                                -- "-HL",

                                -- ### can remove the no-ignore now: put it because i had /~ as git repo
                                -- '--no-ignore-vcs',
                                -- '--no-ignore',

                                '--hidden',
                                '--follow',
                            },
                            -- BUG: doesn't override default
                            mappings = {
                                ['i'] = {
                                    ['<C-d>'] = custom_functions.delete_files,
                                },
                                ['n'] = {
                                    ['dd'] = custom_functions.delete_files,
                                },
                            },
                        },
                        buffers = {
                            initial_mode = 'normal',
                            -- BUG: doesn't override default
                            mappings = {
                                ['i'] = {
                                    ['<C-d>'] = actions.delete_buffer,
                                },
                                ['n'] = {
                                    ['dd'] = actions.delete_buffer,
                                },
                            },

                            --     sort_lastused = true,
                            --     ignore_current_buffer = true,
                        },
                        -- git_files = {
                        --     hidden = true,
                        -- },
                    },
                },
                -- pickers = {}
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
                    },
                    cder = {
                        previewer_command = 'exa '
                            .. '-a '
                            .. '--color=always '
                            .. '-T '
                            .. '--level=3 '
                            .. '--icons '
                            .. '--git-ignore '
                            .. '--long '
                            .. '--no-permissions '
                            .. '--no-user '
                            .. '--no-filesize '
                            .. '--git '
                            .. '--ignore-glob=.git',
                        dir_command = {
                            'fd',
                            '--type=d',
                            '-HL',
                            -- we don't need this, we are using fd and it ignores .gitignore by default
                            '--exclude',
                            'node_modules',
                            '--exclude',
                            '*backup*',
                            '--exclude',
                            '*BACKUP*',
                            '--exclude',
                            '.git/',
                            '--exclude',
                            '*cache',
                            -- '--exclude',
                            -- '^((?!/home/wolf/Programming|/home/wolf/tests|/home/wolf/.dotfiles|/home/wolf/.oh-my-zsh|/home/wolf/tmp).)*$',
                            '.',
                            '/home/wolf/Programming',
                            '/home/wolf/tests',
                            '/home/wolf/.dotfiles',
                            '/home/wolf/.oh-my-zsh',
                            '/home/wolf/tmp',
                        },
                    },
                },
            })

            -- Enable telescope extensions, if they are installed ( prefer doing it in their plugins )
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')
            -- pcall(telescope.load_extension, "neoclip")
            -- pcall(telescope.load_extension("harpoon"))
            -- pcall(telescope.load_extension "media_files")
            -- any other extensions loading

            -- See `:help telescope.builtin`
            local builtin = require('telescope.builtin')
            -- local telescope_utils = require('telescope.utils')
            -- local merge_tables = require('user.utils.functions').merge_tables
            -- local keymap_opts = require('user.utils.options').global_keymap_opts
            --

            -- ####### Telescope keymaps

            -- ## MOST USED

            -- vim.keymap.set(
            --     'n',
            --     '<leader>F',
            --     "<cmd>lua require 'telescope'.extensions.file_browser.file_browser({hidden = true, files=false, grouped=true})<cr>",
            --     set_desc('[F]ile browser')
            -- )

            -- #### IMP: disable if using fzf-lua (replaced with fzf-lua.lua)
            if not _G.user.picker_use_fzf_lua then
                -- old files
                vim.keymap.set(
                    'n',
                    -- '<leader>so',
                    '<C-j>',
                    '<cmd>Telescope oldfiles cwd_only=true previewer=false sort_lastused=true<cr>',
                    set_desc('Old files CWD')
                )
                vim.keymap.set('n', '<leader>sr', function()
                    builtin.oldfiles({
                        previewer = false,
                    })
                end, set_desc('[S]earch [R]ecent Files'))

                -- Slightly advanced example of overriding default behavior and theme
                -- NOTE: c-' doesn't work on tmux, map it to c-/ (which in tmux maps to c-_)
                vim.keymap.set('n', '<C-_>', function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    builtin.current_buffer_fuzzy_find({
                        previewer = false,
                    })
                    -- ) -- can instead get a dropdown
                    -- require('telescope.themes').get_dropdown({
                    --     winblend = 10,
                    --     previewer = false,
                    -- })
                    -- )
                end, set_desc("['] Fuzzy current buffer"))
                -- also add the traditional one to work outside tmux
                vim.keymap.set('n', '<C-/>', function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    builtin.current_buffer_fuzzy_find({
                        previewer = false,
                    })
                end, set_desc("['] Fuzzy current buffer"))
                -- and add a third one fool proof
                vim.keymap.set('n', "<leader>'", function()
                    -- You can pass additional configuration to telescope to change theme, layout, etc.
                    builtin.current_buffer_fuzzy_find({
                        previewer = false,
                    })
                end, set_desc("['] Fuzzy current buffer"))

                vim.keymap.set(
                    'n',
                    '<c-k>',
                    -- '<leader>k',
                    '<cmd>Telescope buffers sort_lastused=true previewer=false initial_mode=insert<cr>',
                    set_desc('[S]earch [B]uffers')
                ) -- telescope buffers

                -- better in telescope, git files
                vim.keymap.set('n', '<leader>sf', function()
                    local find_files_opts = {
                        previewer = false,
                        sort_lastused = true,
                        hidden = true,
                    }

                    local ok = pcall(builtin.git_files, find_files_opts)

                    if not ok then
                        builtin.find_files(find_files_opts)
                    end
                end, set_desc('[S]earch [F]iles GIT'))

                vim.keymap.set(
                    'n',
                    '<leader>sw',
                    builtin.grep_string,
                    set_desc('[S]earch current [W]ord')
                )

                -- telescope buffers
                -- doesn't work with tmux active (c-a is tmux prefix)
                -- vim.keymap.set(
                --     'n',
                --     '<c-a>',
                --     '<cmd>Telescope buffers sort_lastused=true previewer=false initial_mode=insert<cr>',
                --     set_desc('[S]earch [B]uffers')
                -- )

                -- better find file cwd, works good with vim rooter in monorepos
                -- to limit search results to subprojects
                vim.keymap.set(
                    'n',
                    '<leader>f',
                    -- '<C-f>',
                    -- builtin.find_files,
                    -- '<cmd>Telescope find_files cwd_only=true previewer=false sort_lastused=true hidden=true<cr>',
                    -- '<cmd>Telescope find_files cwd_only=true previewer=false sort_lastused=true<cr>',
                    function()
                        builtin.find_files({
                            -- cwd_only = true,
                            -- cwd = telescope_utils.buffer_dir(),
                            cwd = vim.fn.getcwd(),
                            previewer = false,
                            sort_lastused = true,
                            -- BUG: doesn't work hidden
                            hidden = true,
                        })
                    end,
                    set_desc('[S]earch [F]iles CWD')
                )

                -- #### greps, cwd, git, all
                -- TODO: set fuzzy grep
                vim.keymap.set(
                    'n',
                    -- '<leader>k',
                    '<leader>F',
                    -- builtin.live_grep,
                    -- '<cmd>Telescope live_grep cwd_only=true sort_lastused=true hidden=true<cr>',
                    function()
                        builtin.grep_string({
                            shorten_path = true,
                            word_match = '-w',
                            -- use_regex = true,
                            only_sort_text = true,
                            -- cwd = telescope_utils.buffer_dir(),
                            cwd = vim.fn.getcwd(),
                            search = '',
                            -- BUG: doesn't work hidden
                            additional_args = {
                                '--hidden',
                            },
                        })
                    end,
                    set_desc('[F]uzzy grep CWD')
                )

                -- normal grep cwd
                vim.keymap.set(
                    'n',
                    '<leader>k',
                    -- '<C-k>',
                    -- builtin.live_grep,
                    -- '<cmd>Telescope live_grep cwd_only=true sort_lastused=true hidden=true<cr>',
                    function()
                        builtin.live_grep({
                            -- cwd_only = true,
                            cwd = vim.fn.getcwd(),
                            additional_args = {
                                '--hidden',
                            },
                        })
                    end,
                    set_desc('[S]earch [f] grep CWD')
                )
            end

            -- ## OTHERS
            vim.keymap.set(
                'n',
                '<leader>st',
                '<cmd>Telescope treesitter<cr>',
                set_desc('[S]earch [t]reesitter')
            )
            vim.keymap.set(
                'n',
                '<leader>sc',
                '<cmd>Telescope colorscheme<cr>',
                set_desc('[S]earch [C]olorscheme')
            )

            vim.keymap.set(
                'n',
                '<leader>hH',
                builtin.help_tags,
                set_desc('[S]earch [H]elp')
            )
            vim.keymap.set(
                'n',
                '<leader>sK',
                builtin.keymaps,
                set_desc('[S]earch [K]eymaps')
            )

            vim.keymap.set(
                'n',
                '<leader>sF',
                -- builtin.find_files,
                '<cmd>Telescope find_files sort_lastused=true previewer=false hidden=true<cr>',
                set_desc('[S]earch [F]iles ALL')
            )

            vim.keymap.set(
                'n',
                '<leader>sT',
                builtin.builtin,
                set_desc('[S]earch Select [T]elescope')
            )

            vim.keymap.set(
                'n',
                '<leader>sg',
                -- builtin.live_grep,
                '<cmd>Telescope git_grep live_grep sort_lastused=true hidden=true<cr>',
                set_desc('[S]earch [g]rep GIT')
            )
            vim.keymap.set(
                'n',
                '<leader>sG',
                -- builtin.live_grep,
                '<cmd>Telescope live_grep sort_lastused=true hidden=true<cr>',
                set_desc('[S]earch [g]rep ALL')
            )

            vim.keymap.set(
                'n',
                '<leader>sP',
                -- builtin.live_grep,
                '<cmd>Telescope projects<CR>',
                set_desc('[S]earch [P]rojects')
            )

            vim.keymap.set(
                'n',
                '<leader>sd',
                builtin.diagnostics,
                set_desc('[S]earch [D]iagnostics')
            )
            vim.keymap.set(
                'n',
                '<leader>sl',
                builtin.resume,
                set_desc('[S]earch [L]ast')
            )

            vim.keymap.set(
                'n',
                '<leader>hM',
                builtin.man_pages,
                set_desc('[S]earch [M]an pages')
            )
            vim.keymap.set(
                'n',
                '<leader>sb',
                builtin.buffers,
                set_desc('[S]earch [B]uffers')
            )

            vim.keymap.set(
                'n',
                '<leader>gsc',
                '<cmd>Telescope git_commits cwd_only=true<cr>',
                set_desc('Git [C]ommits')
            )

            ------

            vim.keymap.set(
                'n',
                '<leader>lf',
                '<cmd>Telescope lsp_references<cr>',
                set_desc('[T]elescope [L]SP [F]ind References')
            )

            vim.keymap.set(
                'n',
                '<leader>ld',
                '<cmd>Telescope lsp_definitions<cr>',
                set_desc('[T]elescope [L]SP [D]efinitions')
            )

            vim.keymap.set(
                'n',
                '<leader>lD',
                '<cmd>Telescope lsp_workspace_symbols<cr>',
                set_desc('[T]elescope [L]SP [S]ymbols')
            )

            vim.keymap.set(
                'n',
                '<leader>ls',
                '<cmd>Telescope lsp_document_symbols<cr>',
                set_desc('[T]elescope [L]SP [S]ymbols')
            )

            vim.keymap.set(
                'n',
                '<leader>lt',
                '<cmd>Telescope lsp_type_definitions<cr>',
                set_desc('[T]elescope [L]SP [T]ype Definitions')
            )

            vim.keymap.set(
                'n',
                '<leader>le',
                '<cmd>Telescope diagnostics<cr>',
                set_desc('[T]elescope [L]SP [D]iagnostics')
            )

            -- Also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', "<leader>s'", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                })
            end, set_desc('[S]earch in Open Files'))

            -- Shortcut for searching your neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files({ cwd = vim.fn.stdpath('config') })
            end, set_desc('[S]earch [N]eovim files'))
        end,
    },
}
