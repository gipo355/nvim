-- " Keep undo/redo lists in sync with VSCode
-- nmap <silent> u <Cmd>call VSCodeNotify('undo')<CR>
-- nmap <silent> <C-r> <Cmd>call VSCodeNotify('redo')<CR>
vim.keymap.set('n', 'u', '<cmd>call VSCodeNotify("undo")<cr>')
vim.keymap.set('n', '<C-r>', '<cmd>call VSCodeNotify("redo")<cr>')

vim.keymap.set(
    'n',
    '<leader>q',
    '<cmd>q<cr>',
    { noremap = true, silent = true }
)
vim.keymap.set(
    'n',
    '<leader>Q',
    '<cmd>wqa<cr>',
    { noremap = true, silent = true }
)

-- normal and visual mode
vim.keymap.set(
    { 'n', 'v' },
    '<A-j>',
    ':m .+1<CR>==<cr>',
    { noremap = true, silent = true }
)
vim.keymap.set(
    { 'n', 'v' },
    '<A-k>',
    ':m .-2<CR>==<cr>',
    { noremap = true, silent = true }
)

vim.o.number = true

vim.o.clipboard = 'unnamedplus'

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.expandtab = true
vim.o.autoindent = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- " vim.o.termguicolors=true
vim.o.termguicolors = true

-- "Enable mouse click for nvim
vim.o.mouse = 'a'
-- "Fix cursor replacement after closing nvim
-- vim.o.guicursor=
-- "Shift + Tab does inverse tab
-- inoremap <S-Tab> <C-d>

-- "See invisible characters
-- vim.o.list=listchars=tab:>\ ,trail:+,eol:$

-- "wrap to next line when end of line is reached
-- vim.o.whichwrap+=<,>,[,]

vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

-- " keymap('n', '<Leader>xr', notify 'references-view.findReferences', { silent = true }) -- language references
-- " keymap('n', '<Leader>xd', notify 'workbench.actions.view.problems', { silent = true }) -- language diagnostics
-- " keymap('n', '<Leader>gr', notify 'editor.action.goToReferences', { silent = true })
-- " keymap('n', '<Leader>rn', notify 'editor.action.rename', { silent = true })
-- " keymap('n', '<Leader>fm', notify 'editor.action.formatDocument', { silent = true })
-- " keymap('n', '<Leader>ca', notify 'editor.action.refactor', { silent = true }) -- language code actions

-- " keymap('n', '<Leader>rg', notify 'workbench.action.findInFiles', { silent = true }) -- use ripgrep to search files
-- " keymap('n', '<Leader>ts', notify 'workbench.action.toggleSidebarVisibility', { silent = true })
-- " keymap('n', '<Leader>th', notify 'workbench.action.toggleAuxiliaryBar', { silent = true }) -- toggle docview (help page)
-- " keymap('n', '<Leader>tp', notify 'workbench.action.togglePanel', { silent = true })
-- " keymap('n', '<Leader>fc', notify 'workbench.action.showCommands', { silent = true }) -- find commands
-- " keymap('n', '<Leader>ff', notify 'workbench.action.quickOpen', { silent = true }) -- find files
-- " keymap('n', '<Leader>tw', notify 'workbench.action.terminal.toggleTerminal', { silent = true }) -- terminal window

-- " keymap('v', '<Leader>fm', v_notify 'editor.action.formatSelection', { silent = true })
-- " keymap('v', '<Leader>ca', v_notify 'editor.action.refactor', { silent = true })
-- " keymap('v', '<Leader>fc', v_notify 'workbench.action.showCommands', { silent = true })

-- " if exists("g:neovide")
-- " "     set guifont=Fira\ Code\ Nerd\ Font:h14
-- "     set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h13
-- " "     let g:neovide_transparency = 0.0
-- " "     let g:transparency = 0.8
-- " "     let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))
-- " endif

-- if exists('g:vscode')
--     -- " Keep undo/redo lists in sync with VSCode
-- nmap <silent> u <Cmd>call VSCodeNotify('undo')<CR>
-- nmap <silent> <C-r> <Cmd>call VSCodeNotify('redo')<CR>
-- endif

require('lazy').setup({
    -- "folke/which-key.nvim",
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
            {
                "S",
                mode = { "n", "o", "x" },
                function() require("flash").treesitter() end,
                desc =
                "Flash Treesitter"
            },
            {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc =
                "Remote Flash"
            },
            {
                "R",
                mode = { "o", "x" },
                function() require("flash").treesitter_search() end,
                desc =
                "Treesitter Search"
            },
            {
                "<c-s>",
                mode = { "c" },
                function() require("flash").toggle() end,
                desc =
                "Toggle Flash Search"
            },
        },
    },
    {
        -- incremental selection with cr and backspace
        'sustech-data/wildfire.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('wildfire').setup()
        end,
    },
    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    },
    {
        'Wansmer/treesj', -- split join code
        dependencies = {
            'nvim-treesitter',
        },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
            })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        init = function()
            require('nvim-treesitter.configs').setup({
                ensured_installed = 'all',
                -- highlight = {
                --     enable = true,
                -- },
                auto_install = true,
            })
        end,
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'JoosepAlviste/nvim-ts-context-commentstring',

    { 'mg979/vim-visual-multi' },

    {
        'echasnovski/mini.nvim',
        version = false,
        event = 'BufReadPre',
        config = function()
            -- require('mini.animate').setup({})
            -- require('mini.jump').setup()
            -- require("mini.fuzzy").setup()
            -- require("mini.cursorword").setup()
            -- require('mini.sessions').setup({
            --     autoread = true,
            --     autowrite = true,
            -- })
            -- require('mini.completion').setup()
            -- require('mini.splitjoin').setup()
            -- require('mini.surround').setup()
            -- require('mini.indentscope').setup()
            require('mini.ai').setup()
            require('mini.comment').setup()
            require('mini.pairs').setup()
        end,
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('oil').setup({
                -- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
                delete_to_trash = true,
                trash_command = 'trash-put',
            })
            vim.keymap.set(
                'n',
                '-',
                '<CMD>Oil<CR>',
                { desc = 'Open parent directory' }
            )
        end,
    },
})
