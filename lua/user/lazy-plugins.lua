local set_desc = require('user.utils.functions').set_keymap_desc
--  To check the current status of your plugins, run :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins, you can run :Lazy update

--[[ lazy setup
INFO: MOST IMPORTANT

---

During startup, all Lua files used before VimEnter or BufReadPre are byte-compiled and cached

lazy.nvim does NOT use Neovim packages and even disables plugin loading completely (vim.go.loadplugins = false).
It takes over the complete startup sequence for more flexibility and better performance

In practice this means that step 10 of Neovim Initialization is done by Lazy:

    All the plugins' init() functions are executed
    All plugins with lazy=false are loaded. This includes sourcing /plugin and /ftdetect files. (/after will not be sourced yet)
    All files from /plugin and /ftdetect directories in your rtp are sourced (excluding /after)
    All /after/plugin files are sourced (this includes /after from plugins)

Files from runtime directories are always sourced in alphabetical order.

---

USER EVENTS ON PLUGINS TRIGGERED BY LAZY:
 - VeryLazy: triggered after LazyDone and processing VimEnter auto commands

 - LazyDone: when lazy has finished starting up and loaded your config
 - LazySync: after running sync
 - LazyInstall: after an install
 - LazyUpdate: after an update
 - LazyClean: after a clean
 - LazyCheck: after checking for updates
 - LazyLog: after running log
 - LazyLoad: after loading a plugin. The data attribute will contain the plugin name.
 - LazySyncPre: before running sync
 - LazyInstallPre: before an install
 - LazyUpdatePre: before an update
 - LazyCleanPre: before a clean
 - LazyCheckPre: before checking for updates
 - LazyLogPre: before running log
 - LazyReload: triggered by change detection after reloading plugin specs
 - LazyVimStarted: triggered after UIEnter when require("lazy").stats().startuptime has been calculated. Useful to update the startuptime on your dashboard.

---
Plugins opts

EVENT OPTS:
- lazy: When true, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are required, or when one of the lazy-loading handlers triggers
- priority: Only useful for start plugins (lazy=false) to force loading certain plugins first. Default priority is 50. It's recommended to set this to a high number for colorschemes.

FOR LAZY LOADING

USE NEOVIM EVENTS + VERYLAZY
- event: Lazy-load on event. Events can be specified as BufEnter or with a pattern like BufEnter *.lua
- BufRead, BufReadPre, BufReadPost, BufEnter,
BufEnter *.lua (or ft opt), VimEnter or VeryLazy, CmdlineEnter (for plugins that add commands)

OR USE KEYS:
- keys: Lazy-load on key mapping press

OR FILETYPE:
- ft: Lazy-load on file type

- opts: table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the Plugin.config() function. Setting this value will imply Plugin.config()

EXECUTION OPTS:
- config: executed when plugin is loaded
- init: functions are always executed during startup

OTHER OPTS:
- [1]: short for plugin URL
- pin: Don't update this plugin
- build: cmd executed when the plugin is installed
- cond: When false, or if the function returns false, then this plugin will not be loaded.
- enabled: When false, or if the function returns false, then this plugin will not be included in the spec
- url: plugin URL (not needed if you use [1])
]]

require('lazy').setup({
    spec = {
        -- This is the easiest way to modularize your config.

        -- NOTE: it doesn't need to be init.lua, it loads every file with return {} [ or return {{}} and lazy flats it ]
        -- WARN: it loads folders with init.lua (e.g. ../others/utils/init.lua loads ../others/utils.lua)

        -- i prefer this method so i can just add files without manually requiring all of them
        -- this imports the folders and loads all files with return {} in them (also subfolders with init.lua)

        { import = 'user.plugins.singles' },

        -- { import = 'user.plugins.notes' },
        { import = 'user.plugins.mini' },
        { import = 'user.plugins.file-browsers' },
        { import = 'user.plugins.sessions-welcome' },
        { import = 'user.plugins.themes' },
        { import = 'user.plugins.telescope' },

        { import = 'user.plugins.toggleterm' },

        { import = 'user.plugins.http' },

        { import = 'user.plugins.cmp' },
        { import = 'user.plugins.ai' },
        { import = 'user.plugins.git' },

        { import = 'user.plugins.dap' },
        { import = 'user.plugins.lsp.langs' },
        { import = 'user.plugins.lsp.formatters' },
        { import = 'user.plugins.lsp.lspconfig' },
        { import = 'user.plugins.lsp.coc' },

        -- { import = 'user.plugins.runners' },

        { import = 'user.plugins.lua-dev' },

        { import = 'user.plugins.images' },

        -- other ways
        -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

        -- Use `opts = {}` to force a plugin to be loaded.
        -- "gc" to comment visual regions/lines
        -- { 'numToStr/Comment.nvim', opts = {} },

        -- modular approach: using `require 'path/name'` will
        -- include a plugin definition from file lua/path/name.lua
        -- require('plugins.indent_line'),
    },
    defaults = {
        -- from lazyvim repo
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = true,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver

        ui = {
            -- If you have a Nerd Font, set icons to an empty table which will use the
            -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
            icons = _G.user.have_nerd_font and {} or {
                cmd = '⌘',
                config = '🛠',
                event = '📅',
                ft = '📂',
                init = '⚙',
                keys = '🗝',
                plugin = '🔌',
                runtime = '💻',
                require = '🌙',
                source = '📄',
                start = '🚀',
                task = '📌',
                lazy = '💤 ',
            },
        },
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },
    checker = { enabled = false }, -- automatically check for plugin updates
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time,
        rtp = {
            -- disable some rtp plugins
            -- those are builtins
            disabled_plugins = {
                'gzip',
                'matchit',
                -- "matchparen",
                'netrwPlugin',
                'tarPlugin', -- disable editing tar files
                'tohtml',
                'tutor',
                'zipPlugin', -- disable editing zip files
            },
        },
    },
})

-- set keymap to open lazy
vim.keymap.set('n', '<leader>lx', '<cmd>Lazy<CR>', set_desc('Open lazy.nvim'))
