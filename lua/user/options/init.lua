local o = vim.opt
local g = vim.g

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
o.number = true

-- relative line numbers, for help with jumping.
o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = 'a'

-- Don't show the mode, since it's already in status line
o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
o.clipboard = 'unnamedplus'

-- Enable break indent
o.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default, gutter, statuscolumn (handled by plugin statuscol)
-- o.signcolumn = 'yes:3'

-- Decrease update time
o.updatetime = 50
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true

-- shows tabs and trailing spaces ( indent ) and other symbols
o.listchars = {
    -- tab = '» ',
    tab = '▸ ',
    trail = '·',
    nbsp = '␣',
    -- eol = '↴',
    -- extends = '›',
    -- precedes = '‹',
    extends = '…',
    precedes = '…',
}

-- control folding
o.foldexpr = 'nvim_treesitter#foldexpr()'
o.foldlevel = 99 -- prevent folds close on start

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has('nvim-0.10') == 1 then
    o.smoothscroll = true
    o.foldmethod = 'expr'
    o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
else
    o.foldmethod = 'indent'
end

-- Folding
o.foldtext = "v:lua.require'lazyvim.util.ui'.foldtext()"

-- here you can control symbols for folds,
-- window sepaators, end of buffers
o.fillchars = {
    foldopen = '',
    foldclose = '',
    -- fold = "⸱",
    fold = ' ',
    foldsep = ' ',
    diff = '╱',
    -- end of buffer
    eob = '~',
    --    horiz     = '━',
    -- horizup   = '┻',
    -- horizdown = '┳',
    -- vert      = '┃',
    -- vertleft  = '┫',
    -- vertright = '┣',
    -- verthoriz = '╋',
}

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 8

-- ## CUSTOM

o.nu = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.autoindent = true

-- ##### PRIMEAGES #####
o.isfname:append('@-@')
o.wrap = true -- wrap lines at the end of the window

-- highlight search, laggy
vim.opt.hlsearch = false -- possible conflicts with flash nvim? highlight search
vim.opt.incsearch = false -- possible conflicts with flash nvim? incremental search
-- color max width columt

-- Show which line your cursor is on (kanagawa overrides this too, grep for 'cursorline')
o.cursorline = true

-- columns
-- vim.opt.colorcolumn = '81' -- paint a column at 81 characters
-- vim.opt.cursorcolumn = true -- highlight current column vertically

--[[
Cursor shapes:
--]]

-- static cursor no blinking (bypass neovim, use terminal)
o.guicursor = ''

-- static cursor in normal, blinking in insert
-- o.guicursor = 'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100'

-- o.guicursor = table.concat({
--     'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
--     'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
--     'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100',
-- }, ',')

---------

-- ##### end primeagen #####

-- ##### CHRIS #####

-- backups and undo
-- https://gist.github.com/nepsilon/003dd7cfefc20ce1e894db9c94749755

-- ## BACKUP
--[[ if a file is being edited by another program
 (or was written to file while editing with another program),
 it is not allowed to be edited = false for this ]]
o.writebackup = true -- true = "Make backup before overwriting the current buffer

o.backup = true -- true = "Make a backup before overwriting a file
-- TODO: set backupdir or it clutters current folder, change from cache to state
o.backupdir = vim.fn.stdpath('cache') .. '/backup' -- ~/.local/state/nvim/backup

-- "Overwrite the original backup file
o.backupcopy = 'auto'

--  ## UNDO
--  not needed, by default saved in app data folder under
--  ~/.local/state/nvim/undo
--  vim.opt.undodir = vim.fn.stdpath('cache') .. '/undo'
-- Save undo history
o.undofile = true
o.undolevels = 300

-- ## SWAPFILE
-- swapfile is buggy, use git and undo
o.swapfile = false

-- show `` in markdown, hides symbols in markdown, 0 is default no conceal
-- show "" in json
o.conceallevel = 0

-- ### end chris

o.termguicolors = true
o.smartindent = true
o.shell = '/usr/bin/zsh'
-- vim.lsp.buf.hover = true

-- ## from lazyvim
-- ################# from lazyvim

o.autoread = true -- Enable auto read see :h 'autoread'
o.autowrite = true -- Enable auto write see :h 'autowrite'
-- o.autowriteall = true -- Enable auto write for everything see :h 'autowriteall'

o.completeopt = 'menu,menuone,noinsert'
o.confirm = true -- Confirm to save changes before exiting modified buffer
o.formatoptions = 'jcroqlnt' -- tcqj
o.virtualedit = 'block' -- Allow cursor to move where there is no text in visual block mode
o.wildmode = 'longest:full,full' -- Command-line completion mode

-- ## global vars
-- ##### show line numbers in :Explore #####
g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

g.markdown_folding = 1

g.loaded_matchit = 1 -- for vim matchup (also matchparen)

-- ## end custom

-- make popup menu transparent (good for cmp sometimes)
-- value range [0,100]
-- vim.opt.pumblend = 0

-- disable builtin statusline (also disables lualine) -- avante overrides this
if _G.user.statusline.disable_statusline then
    vim.opt.laststatus = 0
end
-- splitkeep screen -- avante overrides this
o.splitkeep = 'screen'

-- better diff view in diffview
o.diffopt = 'internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram'
