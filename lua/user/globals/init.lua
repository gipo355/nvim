-- TODO: allow diabling wakatime, copilot, chatgpt and others (ai?)

local set_transparent_bg = require('user.utils.functions').set_transparent_bg

--[[ 
 In this file we set global variables that can be accessed anywhere in the Lua code everywhere.
 we must require it in the main init.lua so that they are available in the entire configuration.

 Adding some options for most used settings that may require disabling as 
 they are quite intrusive ]]
--

--[[
Another cool thing about the _G object is that it can be used to store global variables and you can change it while the program is running.
Just :lua user.variable = wanted

example:
[https://github.com/hrsh7th/nvim-cmp/issues/715]
So you can change the delay with:
:lua setAutoCompleteDelay(300)
function _G.setAutoCompleteDelay(delay)
]]
--

--[[ prepare user object
we put everything here to have intellisense and to prevent conflicts with other plugins ]]
--
_G.user = {}
-- prepare obj for themes. add them here to have intellisense on the installed
_G.user.themes = {}

--[[ 
for single use variables is to use the vim.g object

or the _G object (which provides intellisense)

I keep vim.g for third party plugins and _G for my own global ]]
--

--[[
 Colemak
]]
--
_G.user.colemak = false -- stil buggy, don't use

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Set to true if you have a Nerd Font installed
_G.user.have_nerd_font = true

-- enable sessions autoload with alpha - neovim-session-manager, buggy
_G.user.enable_sessions_autoload = false

-- enable scroll animation and disable improved movements (laggy)
_G.user.animate_scroll = false

-- enable bufferline (bufferline plugin)
_G.user.enable_bufferline = false

-- lualine plugin
_G.user.enable_lualine = true

-- show function scope at the top of the window (nvim-treesitter)
_G.user.enable_treesitter_context = true

-- enable minimap and scrollbar on the right (mini.map plugin)
_G.user.enable_minimap = false
_G.user.minimap_width = 1 -- 1 for bar only or 10 for bar and map
_G.user.minimap_winblend = 75 -- 0 to 100 transparency

-- alternative minimap and scrollbar, satellite (good with arrow.nvim)
-- lighter than mini map
_G.user.enable_satellite_scrollbar = true

-- WARN: heavy plugins, only enable when needed
-- enable tailwindcss lspconfig start (huge lag)
-- BUG: enabling tailwind requires didChangeWatchedFiles capabilities to false to work (lspconfig)
-- TODO: check if fixed
_G.user.enable_tailwindcss = false
-- enable CSS intellisense (nvim-html-css plugin) pretty heavy, only when needed
_G.user.enable_css_intellisense_in_html = false

-- enable git blame in line (gitsigns plugin)
_G.user.enable_gitblame = true

-- pickers: use fzf-lua or telescope ( only for the mose used keymaps )
_G.user.picker_use_fzf_lua = false

--[[
CMP sources
 those cmp sources are heavy
 cmp ripgrep search in cmp (cmp plugin)
]]
--
_G.user.enable_rg_intellisense_in_cmp = true
_G.user.enable_buffer_intellisense_in_cmp = false

-- TODO: finish this, must alternate between deno and typescript tools
-- use denolsp
-- _G.user.use_deno_disable_ts = false

-- use signatures when entering a function (pretty laggy), we are using mini.completion, faster
_G.user.use_lsp_signature = false
_G.user.mini_completion_lsp_signature = true

-- enable auto save
_G.user.enable_auto_save = false

--[[ theme settings 
]]
-- use mini.colors for customizations on any theme
_G.user.use_mini_colors_customizatio = true

_G.user.transparent_bg = set_transparent_bg(false) -- transparent background

_G.user.background = 'dark' -- dark or light
-- allows to call this later after all vars are set
_G.user.theme = function()
    -- return _G.user.themes.rose_pine
    -- return _G.user.themes.gruvbox_material

    -- need this hack to disable unused themes for performance must hardcode

    -- my favorites

    -- blue themes
    -- return 'monokai-pro'
    -- return 'gruvbox-material'

    -- pink themes

    -- red themes

    -- green themes
    -- return 'rose-pine'
    -- return 'gruvbox-baby'
    -- return 'everforest'
    return 'kanagawa'
    -- return 'melange'
    -- return 'edge'
    -- return 'material'
    -- return 'onedark'
    -- return 'sonokai'
    -- return 'catppuccin'
end

--[[
Indent blankline settings
]]
--
_G.user.enable_indent_blankline = true
_G.user.indent_blankline_color_bg = true -- color the background of indentlines
_G.user.hide_first_indent_level = false -- hide first indent level
_G.user.enable_mini_indentscope = false -- alternative to indent-blankline, single scope

--[[
miscellaneous visual settings
]]
--
_G.user.enable_rainbow_parens = true
_G.user.enable_highlight_colors = true -- css, tailwind colors, color #hex etc..

--[[
This diagnostic config is put here to use it in multiple places
for some reason some themes override the settings (gruvbox-material).
possible conflicts with plugin statuscol
]]
--
_G.user.diagnostic_symbols = {
    error = '',
    warn = '',
    info = '',
    hint = '',
    error_empty = '',
    warn_empty = '',
    info_empty = '',
    hint_empty = '',
}
_G.user.diagnostics_config = {
    underline = true,
    virtual_text = true,
    float = {
        focusable = true,
        border = 'single', -- disable rounded borders on diagnostics float
        header = false,
    },
    -- signs = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = _G.user.diagnostic_symbols.error,
            -- [vim.diagnostic.severity.WARN] = '⚠',
            [vim.diagnostic.severity.WARN] = _G.user.diagnostic_symbols.warn,
            [vim.diagnostic.severity.INFO] = _G.user.diagnostic_symbols.info,
            [vim.diagnostic.severity.HINT] = _G.user.diagnostic_symbols.hint,
        },
        -- linehl = {
        --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        -- },
        -- numhl = {
        --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
        -- },
    },

    update_in_insert = false,
}
vim.diagnostic.config(_G.user.diagnostics_config)
-- set lsp diagnostic symbols (signs)
local function lspSymbol(name, icon)
    vim.fn.sign_define(
        'DiagnosticSign' .. name,
        { text = icon, numhl = 'DiagnosticDefault' .. name }
    )
end
lspSymbol('Error', _G.user.diagnostic_symbols.error)
lspSymbol('Information', _G.user.diagnostic_symbols.info)
lspSymbol('Hint', _G.user.diagnostic_symbols.hint)
lspSymbol('Info', _G.user.diagnostic_symbols.info)
lspSymbol('Warning', _G.user.diagnostic_symbols.warn)
lspSymbol('Warn', _G.user.diagnostic_symbols.warn)

-- root patterns for rooter plugin and <leader>a change root
_G.user.root_patterns = {
    'angular.json',
    'deno.json',
    '.stylua.toml',
    'tsconfig.*.json',
    'tsconfig.json',
    'package.json',
    'vue.config.js',
    'go.mod',
    'project.json',
    'Cargo.toml',
    '*.csproj',
    'pom.xml',
    'build.gradle.kts',
    'settings.gradle.kts',
    'Makefile',
    'go.work',
    '.obsidian',
    '.git',
}

-- enable autocompletion delay for cmp, buggy?
_G.user.enable_autocomplete_delay = true -- trying performance throttle in cmp
_G.user.autocomplete_delay = 200
