local set_desc = require('user.utils.functions').set_keymap_desc
local M = {}

M.fzflua = {
    'ibhagwan/fzf-lua',
    event = 'VimEnter',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        -- local img_previewer = vim.fn.executable("ueberzug") == 1 and { "ueberzug" } or { "viu", "-b" }
        -- local img_previewer = vim.fn.executable("chafa") == 1 and { "chafa" } or { "viu", "-b" }
        local img_previewer = 'chafa'
        local fzf = require('fzf-lua')
        fzf.setup({
            fzf_opts = {
                ['--ansi'] = '',
                ['--prompt'] = ' >',
                -- ['--layout'] = 'reverse-list',
                -- ['--layout'] = 'reverse',
                ['--layout'] = 'default',
            },
            previewers = {
                builtin = {
                    ueberzug_scaler = 'cover',
                    extensions = {
                        ['gif'] = img_previewer,
                        ['png'] = img_previewer,
                        ['jpg'] = img_previewer,
                        ['jpeg'] = img_previewer,
                    },
                },
            },
            winopts = {
                on_create = function()
                    -- called once upon creation of the fzf main window
                    -- can be used to add custom fzf-lua mappings, e.g:
                    vim.api.nvim_buf_set_keymap(
                        0,
                        't',
                        '<C-j>',
                        '<Down>',
                        { silent = true, noremap = true }
                    )
                    vim.api.nvim_buf_set_keymap(
                        0,
                        't',
                        '<C-k>',
                        '<Up>',
                        { silent = true, noremap = true }
                    )
                    vim.api.nvim_buf_set_keymap(
                        0,
                        't',
                        '<C-c>',
                        ':norm q<CR>',
                        { silent = true, noremap = true }
                    )
                end,
            },
            grep = {
                --     glob_flag      = "--iglob", -- for case sensitive globs use '--glob'
                --     glob_separator = "%s%-%-" -- query separator pattern (lua): ' --'
                actions = {
                    -- for some reason c-g default not working, closes window. some conflict with telescope or toggleterm or keybinds?
                    ['ctrl-e'] = fzf.actions.grep_lgrep, -- check manual for fzf-lua.txt, grep ctrl-g
                },
            },
            -- files = {
            --     path_shorten = 3,
            --     --     actions = {
            --     --     },
            -- },
            diagnostics = {
                cwd_only = true,
            },
            -- tags = {
            --     actions = {
            --     },
            -- },
        })

        -- keymaps
        -- complete path

        -- ### FZF-lua enabled
        if _G.user.pickers.fzf_lua.enable then
            -- buffers
            vim.keymap.set('n', '<c-k>', function()
                require('fzf-lua').buffers({
                    previewer = false,
                })
            end, set_desc('fzf-lua buffers'))

            -- BETTER in telescope git files
            vim.keymap.set('n', '<leader>sf', function()
                require('fzf-lua').git_files({
                    -- cwd = vim.fn.getcwd(),
                    -- previewer = 'bat',
                })
            end, set_desc('fzf git files'))

            -- complete file
            vim.keymap.set({ 'i' }, '<C-x><C-f>', function()
                require('fzf-lua').complete_file({
                    cmd = 'rg --files',
                    winopts = { preview = { hidden = 'nohidden' } },
                })
            end, { silent = true, desc = 'Fuzzy complete file' })

            -- ### BETTER in telescope
            -- fuzzy find in current buffer
            local function fzf_grep_curbuf()
                require('fzf-lua').grep_curbuf({
                    previewer = 'bat',
                })
            end
            vim.keymap.set(
                'n',
                '<C-/>',
                fzf_grep_curbuf,
                set_desc('fzf grep buffer')
            )
            vim.keymap.set(
                'n',
                "<C-'>",
                fzf_grep_curbuf,
                set_desc('fzf grep buffer')
            )
            vim.keymap.set(
                'n',
                '<C-_>',
                fzf_grep_curbuf,
                set_desc('fzf grep buffer')
            )
            vim.keymap.set(
                'n',
                "<leader>'",
                fzf_grep_curbuf,
                set_desc('fzf grep buffer')
            )

            -- old files
            -- vim.keymap.set('n', '<leader>sr', function()
            --     require('fzf-lua').oldfiles()
            -- end, set_desc('fzf oldfiles'))
            vim.keymap.set('n', '<c-j>', function()
                require('fzf-lua').oldfiles({
                    cwd = vim.fn.getcwd(),
                    previewer = false,
                })
            end, set_desc('fzf oldfiles cwd'))

            -- fzf.files({ cwd = vim.fn.expand('%:p:h') })
            vim.keymap.set('n', '<leader>f', function()
                require('fzf-lua').files({ cwd = vim.fn.getcwd() })
            end, set_desc('fzf cwd'))

            -- fzf.grep()
            vim.keymap.set('n', '<leader>F', function()
                require('fzf-lua').live_grep({
                    cwd = vim.fn.getcwd(),
                    -- previewer = 'bat',
                })
            end, set_desc('fzf grep all'))

            vim.keymap.set('n', '<leader>k', function()
                require('fzf-lua').live_grep_glob({
                    cwd = vim.fn.getcwd(),
                    -- previewer = 'bat',
                    -- query = vim.fn.expand('<cword>'),
                })
            end, set_desc('fzf grep cwd'))

            -- fzf.grep_cword()
            vim.keymap.set('n', '<leader>sw', function()
                require('fzf-lua').grep_cword()
            end, set_desc('fzf grep cword'))

            -- fzf.quickfix()

            -- fzf.keymaps()

            -- fzf.jumps()

            -- fzf.marks()

            -- fzf.git_commits()
            vim.keymap.set('n', '<leader>gcc', function()
                require('fzf-lua').git_commits()
            end, set_desc('fzf git commits'))

            vim.keymap.set('n', '<leader>gcf', function()
                require('fzf-lua').git_bcommits()
            end, set_desc('fzf git commits file'))

            vim.keymap.set('n', '<leader>gt', function()
                require('fzf-lua').git_tags()
            end, set_desc('fzf git tags'))

            vim.keymap.set('n', '<leader>go', function()
                require('fzf-lua').git_status()
            end, set_desc('fzf git status'))

            vim.keymap.set('n', '<leader>gb', function()
                require('fzf-lua').git_branches()
            end, set_desc('fzf git branches'))

            -- ## LSP
            vim.keymap.set(
                'n',
                '<leader>lr',
                '<CMD>FzfLua lsp_references<CR>',
                set_desc('Fzf Lsp references')
            )
            vim.keymap.set(
                'n',
                'gr',
                '<CMD>FzfLua lsp_references<CR>',
                set_desc('Fzf Lsp references')
            )
            vim.keymap.set(
                'n',
                '<leader>ld',
                '<CMD>FzfLua lsp_definitions<CR>',
                set_desc('Fzf Lsp definitions')
            )
            vim.keymap.set(
                'n',
                'gd',
                '<CMD>FzfLua lsp_definitions<CR>',
                set_desc('Fzf Lsp definitions')
            )
            vim.keymap.set(
                'n',
                '<leader>lD',
                '<CMD>FzfLua lsp_declarations<CR>',
                set_desc('Fzf Lsp declarations')
            )
            vim.keymap.set(
                'n',
                'gD',
                '<CMD>FzfLua lsp_declarations<CR>',
                set_desc('Fzf Lsp declarations')
            )
            vim.keymap.set(
                'n',
                '<leader>li',
                '<CMD>FzfLua lsp_implementations<CR>',
                set_desc('Fzf Lsp implementations')
            )
            vim.keymap.set(
                'n',
                'gi',
                '<CMD>FzfLua lsp_implementations<CR>',
                set_desc('Fzf Lsp implementations')
            )
            vim.keymap.set(
                'n',
                '<leader>ls',
                '<CMD>FzfLua lsp_document_symbols<CR>',
                set_desc('Fzf Lsp document symbols')
            )
            vim.keymap.set(
                'n',
                '<leader>lw',
                '<CMD>FzfLua lsp_live_workspace_symbols<CR>',
                set_desc('Fzf Lsp workspace symbols')
            )
            vim.keymap.set(
                'n',
                '<leader>lt',
                '<CMD>FzfLua lsp_typedefs<CR>',
                set_desc('Fzf Lsp typedefs')
            )

            -- missing in telescope
            vim.keymap.set({ 'n', 'v' }, '<leader>la', function()
                require('fzf-lua').lsp_code_actions()
            end, set_desc('fzf grep code actions'))

            vim.keymap.set(
                'n',
                '<leader>sl',
                '<CMD>FzfLua resume<CR>',
                set_desc('Fzf resume')
            )

            vim.keymap.set(
                'n',
                '<leader>le',
                -- '<CMD>FzfLua diagnostics_workspace<CR>',
                function()
                    require('fzf-lua').lsp_document_diagnostics({
                        cwd = vim.fn.getcwd(),
                        -- previewer = false,
                    })
                end,
                set_desc('Fzf diagnostics document')
            )

            vim.keymap.set(
                'n',
                '<leader>lE',
                -- '<CMD>FzfLua diagnostics_workspace<CR>',
                function()
                    require('fzf-lua').lsp_workspace_diagnostics({
                        cwd = vim.fn.getcwd(),
                        -- previewer = false,
                    })
                end,
                set_desc('Fzf diagnostics workspace')
            )

            -- vim.keymap.set(
            --     'n',
            --     '<leader>lf',
            --     '<CMD>FzfLua lsp_finder<CR>',
            --     set_desc('Fzf Lsp finder')
            -- )
        end
    end,
}
-- faster telescope
if _G.user.pickers.fzf_lua.enable then
    return M.fzflua
else
    return {}
end
