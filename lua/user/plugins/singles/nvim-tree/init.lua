--[[
This file contains and keymaps plugins that work with projects and create side effects 
like chaning cwd etc

it also condense keymaps for tabs handling

the plugins that could change cwd are:
project.nvim
vim-rooter
nvim-tree
mini.misc.setup_auto_root
]]
--

local icons = require('user.utils.icons')
local set_desc = require('user.utils.functions').set_keymap_desc

local nvim_tree_on_attach =
    require('user.plugins.singles.nvim-tree.utils.setups').on_attach

-- ##### auto cd: controlled by mini.misc to find root (it sets it to false) #####
-- possible conflicts with vim-rooter and mini.misc autoroot
vim.opt.autochdir = false -- we don't want to change cwd automatically

-- ## tcd file and print (use tcd) [https://www.reddit.com/r/neovim/comments/zy5s0l/you_dont_need_vimrooter_usually_or_how_to_set_up/]
vim.keymap.set(
    'n',
    '<leader>c',
    -- '<cmd>lcd %:p:h<cr>:pwd<cr>', -- change dir for current window
    -- '<cmd>cd %:p:h<cr>:pwd<cr>', -- change dir
    '<cmd>tcd %:p:h<cr>:pwd<cr>', -- change dir for tabs
    set_desc('cd ls .')
)

-- setup tabs keybinds and opts
require('user.plugins.singles.nvim-tree.utils.tabs_keybinds_opts')

-- also check vim-rooter and mini.misc.setup_auto_root autoroot for auto cds

return {
    -- alternative: USING mini.misc.setup_auto_root atm with leader>a to change cwd to root
    -- adding vim rooter to change cwd.
    -- this way telescope will only show scoped files
    -- if you need to change cwd manually can also use mini.misc.setup_auto_root with
    -- cmd minimisc.find_root({files})
    -- {
    --     'airblade/vim-rooter',
    --     config = function()
    --         vim.g.rooter_patterns = _G.user.root_patterns
    --         -- vim.g.rooter_silent_chdir = 1 -- stop echoing cwd on change
    --         vim.g.rooter_manual_only = 1 -- only manual change
    --         vim.g.rooter_cd_cmd = 'tcd' -- change dir for tabs only
    --         vim.g.rooter_resolve_links = 1 -- resolve links
    --
    --         -- manually change cwd to root pattern
    --         vim.keymap.set(
    --             'n',
    --             '<leader>C',
    --             -- command to trigger auto rooter
    --             '<cmd>Rooter<cr>',
    --             set_desc('cd to root')
    --         )
    --     end,
    -- },

    -- changes cwd, conflicts with root
    {
        'ahmedkhalf/project.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        event = 'VeryLazy',
        config = function()
            require('project_nvim').setup({
                manual_mode = true, -- doesn't change cwd in manual mode
            })
            pcall(require('telescope').load_extension('projects'))
        end,
    },
    {
        -- ##### automatically refactor when renaming and other goodies - substitute tsserver rename file #####
        -- has config in lspconfig capabilities making
        'antosha417/nvim-lsp-file-operations',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-tree.lua',
        },
        config = function()
            require('lsp-file-operations').setup()
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        enabled = _G.user.nvimtree.enable,
        event = 'User DirOpened',
        cmd = {
            'NvimTreeToggle',
            'NvimTreeOpen',
            'NvimTreeFocus',
            'NvimTreeFindFileToggle',
        },
        config = function()
            require('nvim-tree').setup({
                -- cwd settigns
                disable_netrw = false,
                hijack_netrw = true,
                root_dirs = {},
                prefer_startup_root = false,
                sync_root_with_cwd = true,
                respect_buf_cwd = true,

                auto_reload_on_write = true,
                hijack_cursor = false,
                hijack_unnamed_buffer_when_opening = false,
                sort_by = 'name',
                reload_on_bufenter = true,
                -- on_attach = 'default',
                on_attach = nvim_tree_on_attach,
                select_prompts = false,
                view = {
                    adaptive_size = true,
                    centralize_selection = true,
                    width = 30,
                    side = _G.user.nvimtree.side,
                    preserve_window_proportions = false,
                    number = true,
                    relativenumber = true,
                    signcolumn = 'yes',
                    float = {
                        enable = false,
                        quit_on_focus_loss = true,
                        open_win_config = {
                            relative = 'editor',
                            border = 'rounded',
                            width = 30,
                            height = 30,
                            row = 1,
                            col = 1,
                        },
                    },
                },
                renderer = {
                    add_trailing = false,
                    group_empty = true, --   good for java
                    highlight_git = true,
                    full_name = false,
                    highlight_opened_files = 'all',
                    root_folder_label = ':t',
                    indent_width = 2,
                    indent_markers = {
                        enable = true,
                        inline_arrows = true,
                        icons = {
                            corner = '└',
                            edge = '│',
                            item = '│',
                            none = ' ',
                        },
                    },
                    icons = {
                        webdev_colors = _G.user.have_nerd_font,
                        git_placement = 'before',
                        padding = ' ',
                        symlink_arrow = ' ➛ ',
                        show = {
                            file = _G.user.have_nerd_font,
                            folder = _G.user.have_nerd_font,
                            folder_arrow = _G.user.have_nerd_font,
                            git = _G.user.have_nerd_font,
                        },
                        glyphs = {
                            default = icons.ui.Text,
                            symlink = icons.ui.FileSymlink,
                            bookmark = icons.ui.BookMark,
                            folder = {
                                arrow_closed = icons.ui.TriangleShortArrowRight,
                                arrow_open = icons.ui.TriangleShortArrowDown,
                                default = icons.ui.Folder,
                                open = icons.ui.FolderOpen,
                                empty = icons.ui.EmptyFolder,
                                empty_open = icons.ui.EmptyFolderOpen,
                                symlink = icons.ui.FolderSymlink,
                                symlink_open = icons.ui.FolderOpen,
                            },
                            git = {
                                unstaged = icons.git.FileUnstaged,
                                staged = icons.git.FileStaged,
                                unmerged = icons.git.FileUnmerged,
                                renamed = icons.git.FileRenamed,
                                untracked = icons.git.FileUntracked,
                                deleted = icons.git.FileDeleted,
                                ignored = icons.git.FileIgnored,
                            },
                        },
                    },
                    special_files = {
                        'Cargo.toml',
                        'Makefile',
                        'README.md',
                        'readme.md',
                    },
                    symlink_destination = true,
                },

                -- cwd settings
                hijack_directories = {
                    enable = false,
                    auto_open = true,
                },
                update_focused_file = {
                    enable = true,
                    -- changes cwd
                    update_cwd = false, -- conflicts with mini.misc autoroot and vim-rooter
                    debounce_delay = 15,
                    -- changes root cwd
                    update_root = false, -- conflicts with mini.misc autoroot and vim-rooter
                    ignore_list = {},
                },

                diagnostics = {
                    enable = _G.user.have_nerd_font,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                    debounce_delay = 50,
                    severity = {
                        min = vim.diagnostic.severity.HINT,
                        max = vim.diagnostic.severity.ERROR,
                    },
                    icons = {
                        hint = icons.diagnostics.BoldHint,
                        info = icons.diagnostics.BoldInformation,
                        warning = icons.diagnostics.BoldWarning,
                        error = icons.diagnostics.BoldError,
                    },
                },
                filters = {
                    dotfiles = false,
                    git_clean = false,
                    no_buffer = false,
                    -- custom = { 'node_modules', '\\.cache' },
                    exclude = {},
                },
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                    ignore_dirs = {},
                },
                git = {
                    enable = true,
                    ignore = false,
                    show_on_dirs = true,
                    show_on_open_dirs = true,
                    timeout = 200,
                },
                actions = {
                    use_system_clipboard = true,
                    change_dir = {
                        enable = true,
                        global = false,
                        restrict_above_cwd = false,
                    },
                    expand_all = {
                        max_folder_discovery = 300,
                        exclude = {},
                    },
                    file_popup = {
                        open_win_config = {
                            col = 1,
                            row = 1,
                            relative = 'cursor',
                            border = 'shadow',
                            style = 'minimal',
                        },
                    },
                    open_file = {
                        quit_on_open = false,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                            picker = 'default',
                            chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
                            exclude = {
                                filetype = {
                                    'notify',
                                    'lazy',
                                    'qf',
                                    'diff',
                                    'fugitive',
                                    'fugitiveblame',
                                },
                                buftype = { 'nofile', 'terminal', 'help' },
                            },
                        },
                    },
                    remove_file = {
                        close_window = true,
                    },
                },
                trash = {
                    cmd = 'trash-put',
                    require_confirm = true,
                },
                live_filter = {
                    prefix = '[FILTER]: ',
                    always_show_folders = true,
                },
                tab = {
                    sync = {
                        open = false,
                        close = false,
                        ignore = {},
                    },
                },
                notify = {
                    threshold = vim.log.levels.INFO,
                },
                log = {
                    enable = false,
                    truncate = false,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        dev = false,
                        diagnostics = false,
                        git = false,
                        profile = false,
                        watcher = false,
                    },
                },
                system_open = {
                    cmd = nil,
                    args = {},
                },
            })

            vim.keymap.set(
                'n',
                '<leader>e',
                '<cmd>NvimTreeToggle<cr>',
                set_desc('NvimTree')
            )
        end,
    },
}
