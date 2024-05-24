return {
    'nvim-neo-tree/neo-tree.nvim',
    -- version = '*',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
        {
            -- alternative to something i have (built in into nvimtree)
            's1n7ax/nvim-window-picker',
            -- version = '2.*',
            config = function()
                require('window-picker').setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = {
                                'neo-tree',
                                'neo-tree-popup',
                                'notify',
                            },
                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { 'terminal', 'quickfix' },
                        },
                    },
                })
            end,
        },
    },
    config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define(
            'DiagnosticSignError',
            { text = ' ', texthl = 'DiagnosticSignError' }
        )
        vim.fn.sign_define(
            'DiagnosticSignWarn',
            { text = ' ', texthl = 'DiagnosticSignWarn' }
        )
        vim.fn.sign_define(
            'DiagnosticSignInfo',
            { text = ' ', texthl = 'DiagnosticSignInfo' }
        )
        vim.fn.sign_define(
            'DiagnosticSignHint',
            { text = '󰌵', texthl = 'DiagnosticSignHint' }
        )
        require('neo-tree').setup({
            close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
            popup_border_style = 'rounded',
            enable_git_status = true,
            enable_diagnostics = true,
            neotree_popup_input_ready = true, -- enable input in popup
            event_handlers = {
                {
                    event = 'neo_tree_popup_input_ready',
                    ---@param input NuiInput
                    handler = function()
                        -- enter input popup with normal mode by default.
                        vim.cmd('stopinsert')
                    end,
                },
            },
            open_files_do_not_replace_types = {
                'terminal',
                'trouble',
                'qf',
            }, -- when opening files, do not use windows containing these filetypes or buftypes
            sources = {
                'document_symbols',
                'git_status',
                'filesystem',
                'buffers',
            },
            source_selector = {
                sources = { -- table
                    {
                        source = 'filesystem', -- string
                        display_name = ' 󰉓 Files ', -- string | nil
                    },
                    {
                        source = 'buffers', -- string
                        display_name = ' 󰈚 Buffers ', -- string | nil
                    },
                    {
                        source = 'git_status', -- string
                        display_name = ' 󰊢 Git ', -- string | nil
                    },
                    {
                        source = 'document_symbols', -- string
                        display_name = ' 󰜅 Symbols ', -- string | nil
                    },
                },
            },

            sort_case_insensitive = false, -- used when sorting files and directories in the tree
            default_component_configs = {
                container = {
                    enable_character_fade = true,
                },
                indent = {
                    indent_size = 2,
                    padding = 1, -- extra padding on left hand side
                    -- indent guides
                    with_markers = true,
                    indent_marker = '│',
                    last_indent_marker = '└',
                    highlight = 'NeoTreeIndentMarker',
                    -- expander config, needed for nesting files
                    with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = '',
                    expander_expanded = '',
                    expander_highlight = 'NeoTreeExpander',
                },
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = '󰜌',
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = '*',
                    highlight = 'NeoTreeFileIcon',
                },
                modified = {
                    symbol = '[+]',
                    highlight = 'NeoTreeModified',
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = 'NeoTreeFileName',
                },
                git_status = {
                    symbols = {
                        -- Change type
                        -- added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = '✖', -- this can only be used in the git_status source
                        renamed = '󰁕', -- this can only be used in the git_status source
                        -- Status type
                        untracked = '',
                        ignored = '',
                        unstaged = '󰄱',
                        staged = '',
                        conflict = '',
                    },
                },
                -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
                file_size = {
                    enabled = true,
                    required_width = 64, -- min width of window required to show this column
                },
                type = {
                    enabled = true,
                    required_width = 122, -- min width of window required to show this column
                },
                last_modified = {
                    enabled = true,
                    required_width = 88, -- min width of window required to show this column
                },
                created = {
                    enabled = true,
                    required_width = 110, -- min width of window required to show this column
                },
                symlink_target = {
                    enabled = false,
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true, -- when true, they will just be displayed differently than normal items
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false, -- only works on Windows for hidden files/directories
                },
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
                    --               -- the current file is changed while the tree is open.
                    leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                group_empty_dirs = false, -- when true, empty folders will be grouped together
                hijack_netrw_behavior = 'disabled', -- current, default, disabled -- we use oil
            },
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.

            buffers = {
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
                    --              -- the current file is changed while the tree is open.
                    leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                },
                group_empty_dirs = false, -- when true, empty folders will be grouped together
                show_unloaded = true,
            },

            window = {
                mappings = {
                    ['h'] = 'close_node',
                    ['l'] = 'open',
                    ['TAB'] = {
                        'toggle_preview',
                        config = { use_float = false, use_image_nvim = true },
                    },
                    ['P'] = {
                        'toggle_preview',
                        config = { use_float = false, use_image_nvim = true },
                    },
                    ['Z'] = 'expand_all_nodes',
                },
            },
        })
        vim.keymap.set(
            'n',
            '<leader>e',
            '<cmd>Neotree toggle<cr>',
            { desc = 'Neotree' }
        )
        vim.keymap.set(
            'n',
            '<leader>bg',
            '<cmd>Neotree toggle git_status<cr>',
            { desc = 'Neotree git status' }
        )
        vim.keymap.set(
            'n',
            '<leader>bs',
            '<cmd>Neotree toggle document_symbols<cr>',
            { desc = 'Neotree document symbols' }
        )
        vim.keymap.set(
            'n',
            '<leader>bb',
            '<cmd>Neotree toggle buffers<cr>',
            { desc = 'Neotree buffers' }
        )
    end,
}
