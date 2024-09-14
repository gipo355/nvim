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

--------------------------------
--[[ prepare user object
we put everything here to have intellisense and to prevent conflicts with other plugins ]]
--
_G.user = {}
-- prepare obj for themes. add them here to have intellisense on the installed
_G.user.themes = {}

_G.user.mini = {}

--[[
for single use variables is to use the vim.g object

or the _G object (which provides intellisense)

I keep vim.g for third party plugins and _G for my own global ]]
--

--------------------------------
--[[
 Colemak
]]
--
_G.user.colemak = false -- stil buggy, don't use

--------------------------------
--[[
    Precognition plugin
    shows hints for movements
]]
_G.user.precognition = {
    enable = false,
}

--------------------------------
--[[
    AI
    note: zed, cursor, and vscode editors have deep and better integration with AI
]]
_G.user.ai = {
    ---@type 'copilot' | 'supermaven'
    autocomplete = 'supermaven',
    copilot = {
        chat = {
            enable = true,
        },
    },
    -- this tries to simulate Cursor IDE with deep integration of ai
    -- into editor.
    -- Also check aider AI
    -- https://github.com/joshuavial/aider.nvim
    avante = {
        enable = true,
    },
    aider = {
        enable = false,
    },
}

--------------------------------

-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Set to true if you have a Nerd Font installed
_G.user.have_nerd_font = true

-- Alpha: enable start screen dashboard
_G.user.alpha = {
    enable = false,
    type = 'dashboard', -- dashboard or startify or theta
}

-- enable auto save
_G.user.autosave = {
    enable = false,
}

-- enable sessions autoload with alpha - neovim-session-manager, buggy
_G.user.session_manager = {
    enable_autoload = false,
}

-- enable scroll animation and disable improved movements (laggy)
_G.user.mini.animate_scroll = {
    enable = false,
}

--------------------------------
--[[ VERTICAL SPACE

 Lualine, bufferline, treesitter context and built-in statusline occupy space at the top and bottom
 disable all to get back 100% of the width
]]

-- enable bufferline (bufferline plugin)
_G.user.bufferline = {
    enable = false,
}
-- lualine plugin
_G.user.lualine = {
    enable = true,
    show_lsp = true,
}
-- disable builtin statusline
-- avante overrides this
_G.user.statusline = {
    disable_builtin = true,
}
-- disable status line in tmux to recover space
_G.user.tmux = {
    disable_statusline = true,
}
-- show function scope at the top of the window (nvim-treesitter)
_G.user.treesitter_context = {
    enable = true,
    max_lines = 4, -- maximum number of lines to show
    multiline_threshold = 1, -- max n of lines for single context
}

--------------------------------
--[[ File explorers ]]

_G.user.mini.files = {
    enable = true,
}

_G.user.oil = {
    enable = true,
}

_G.user.nvimtree = {
    enable = true,
    side = 'left',
}

--------------------------------
--[[ Scrollbars, minimaps, lspsymbols ]]

-- enable minimap and scrollbar on the right (mini.map plugin)
-- problem: this is 1 map even if split vertically
_G.user.mini.map = {
    enable = false,
    minimap_width = 10, -- 1 for bar only or 10 for bar and map
    minimap_winblend = 75, -- 0 to 100 transparency
    side = 'right', -- right or left
}

-- alternative minimap and scrollbar, satellite (good with arrow.nvim)
-- lighter than mini map
_G.user.satellite_scrollbar = {
    enable = true,
}
-- there is another option: aerial.nvim, lspsaga symbols-outline, trouble symbols, minimap.nvim, codewindow.nvim, neominimap.nvim
-- they can all function as symbols minimap
_G.user.codewindow = {
    enable = false,
}

-- neominimap plugin, another minimap
_G.user.neominimap = {
    enable = false,
    max_height = 100, -- max height of minimap, nil = no max
}

-- aerial lsp symbols map
_G.user.aerial = {
    enable = false,
    direction = 'prefer_right',
}

--[[ NOICE ]]
_G.user.noice = {
    enable = true,
    message = true,
    notify = true,
}

--------------------------------
--[[ LSP ]]
_G.user.lsp = {
    inlay_hints = {
        enable = false,
    },
    -- use signatures when entering a function (pretty laggy), we are using mini.completion, faster
    function_signature = {
        ---@type "lsp_signature" | "mini" | "noice"| "none"
        source = 'lsp_signature',
    },
    lsp_progress = {
        ---@type "fidget" | "noice"| "none"
        source = 'none',
    },
    diagnostics = {
        enable = true,
    },
    -- enable format on save
    format_on_save = true,
    -- this is a list of lsp formatters passed to a filter function
    -- in conform to prevent autoformatting on save from those sources
    skipped_lsp_formatters = {
        ['typescript-tools'] = true, -- conflicts with prettier and eslint
        ['html'] = true, -- conflicts with prettier
        ['cssls'] = true, -- conflicts with prettier and stylelint
        ['biome'] = true, -- conflicts with prettier and eslint
        ['jsonls'] = true, -- conflicts with prettier
        ['lua_ls'] = true, -- conflicts with stylua
        ['yamlls'] = true, -- conflicts with stylua
        ['jdtls'] = true, -- conflicts with google-java-format
    },
    -- this is a list of lsp callbacks to execute on save if the lsp formatter is active
    lsp_callbacks = {
        ['typescript-tools'] = function()
            vim.cmd('TSToolsFixAll')
        end,
    },
}
--------------------------------

--------------------------------
--[[ HEAVY PLUGINS ]]

-- [[ TAILWIND ]]
-- enable tailwindcss lspconfig start (huge lag)
-- enabling tailwind requires didChangeWatchedFiles capabilities to false to work (lspconfig)
-- NOTE: looks like it's fixed
_G.user.tailwindcss = {
    enable_lsp = true,
    tailwind_tools = {
        enable = true,
        enable_conceal = false,
        -- plugin highligh colors can do the same thing
        enable_colors = false,
    },
}

--[[ Indent blankline settings ]]
_G.user.indent_blankline = {
    enable = true,
    scope = true,
    color = true, -- color the background of indentlines
    color_background = true, -- color the background of indentlines
    hide_first_indent_level = false, -- hide first indent level
}
_G.user.mini.indentscope = {
    enable = false,
}

--------------------------------
--[[ miscellaneous visual settings ]]
-- rainbow parentheses and html tags colorized
_G.user.rainbow_parens = {
    enable = true,
}
-- css, tailwind colors, color #hex etc..
_G.user.highlight_colors = {
    enable = true,
    render = 'virtual', -- 'virtual' or 'background' or 'foreground'
}

-- cursor modes colors
_G.user.cursor_modes = {
    enable = true,
}

-- enable CSS intellisense (nvim-html-css plugin) pretty heavy, only when needed
_G.user.htmlcss_intellisense = {
    enable = false,
}

-- enable git blame in line (gitsigns plugin)
_G.user.gitsigns = {
    current_line_blame = false,
}
--------------------------------
--[[ PICKERS ]]

-- pickers: use fzf-lua or telescope ( only for the mose used keymaps )
_G.user.pickers = {
    -- this disables telescope for most used keymaps and uses fzf-lua instead
    fzf_lua = {
        enable = false,
    },
}

--------------------------------
--[[ enable ufo folding plugin
--BUG: bugs diffview difftool ]]
_G.user.ufo = {
    enable = true,
}

--------------------------------
--[[
CMP heavy sources
ripgrep and buffer
 those cmp sources are heavy
 cmp ripgrep search in cmp (cmp plugin)
]]
--
_G.user.cmp = {
    ghost_text = false,
    rg_intellisense = {
        enable = false,
    },
    buffer_intellisense = {
        enable = false,
    },
    -- enable autocompletion delay for cmp, buggy?
    -- trying performance throttle in cmp
    autocomplete_delay = {
        enable = false,
        delay = 200,
    },
}

-- TODO: finish this, must alternate between deno and typescript tools
-- use denolsp
-- _G.user.use_deno_disable_ts = false

--------------------------------

--------------------------------
--[[ Theme and color settings ]]

-- use mini.colors for customizations on any theme
_G.user.mini.colors = {
    enable = true,
}

_G.user.transparent_background = set_transparent_bg(false) -- transparent background

_G.user.background = 'dark' -- dark or light
-- allows to call this later after all vars are set
_G.user.theme = function()
    -- return _G.user.themes.rose_pine
    -- return _G.user.themes.gruvbox_material

    -- need this hack to disable unused themes for performance must hardcode

    -- my favorites

    -- return 'vague'
    -- return 'monokai-pro'
    return 'gruvbox-baby'
    -- return 'kanagawa'
    -- return 'gruvbox-material'
    -- return 'rose-pine'
    -- return 'ares'
    -- return 'onedark'

    -- return 'zenbones'
    -- return 'forestbones'
    -- return 'seoulbones'
    -- return 'zenburned'
    -- return 'rosebones'
    -- return 'nordbones'
    -- return 'tokyobones'
    -- return 'kanagawabones'

    -- return 'material'
    -- return 'sonokai'
    -- return 'catppuccin'

    -- have light variant
    -- return 'gruvbox-material'
    -- return 'kanagawa-lotus'
    -- return 'melange'
    -- return 'rose-pine'
    -- return 'everforest'
    -- return 'edge'
end

--------------------------------
--[[
    trouble setting
]]
_G.user.trouble = {
    enable = true,
    show_symbols = true,
}

--------------------------------
--[[ LSP Diagnostics ]]

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
            -- [vim.diagnostic.severity.E] = _G.user.diagnostic_symbols.error,
            -- [vim.diagnostic.severity.W] = _G.user.diagnostic_symbols.warn,
            -- [vim.diagnostic.severity.I] = _G.user.diagnostic_symbols.info,
            -- [vim.diagnostic.severity.H] = _G.user.diagnostic_symbols.hint,
            [vim.diagnostic.severity[1]] = _G.user.diagnostic_symbols.error,
            [vim.diagnostic.severity[2]] = _G.user.diagnostic_symbols.warn,
            [vim.diagnostic.severity[3]] = _G.user.diagnostic_symbols.info,
            [vim.diagnostic.severity[4]] = _G.user.diagnostic_symbols.hint,
            -- ['DiagnosticSignError'] = _G.user.diagnostic_symbols.error,
            -- ['DiagnosticSignWarn'] = _G.user.diagnostic_symbols.warn,
            -- ['DiagnosticSignWarning'] = _G.user.diagnostic_symbols.warn,
            -- ['DiagnosticSignInfo'] = _G.user.diagnostic_symbols.info,
            -- ['DiagnosticSignHint'] = _G.user.diagnostic_symbols.hint,
            -- ['DiagnosticSignInformation'] = _G.user.diagnostic_symbols.hint,
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
-- WARN: deprecated, use vim.diagnostic.config instead (signs field)
-- https://github.com/mfussenegger/nvim-dap/discussions/355
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

--------------------------------
--[[ Rooter and root patterns ]]

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
    'pom.xml',
    'build.gradle.kts',
    'build.gradle',
    'settings.gradle',
    '.git',
}

--------------------------------
--[[
  Enable java plugin, pretty heavy
]]
_G.user.java = {
    enable = true,
}
