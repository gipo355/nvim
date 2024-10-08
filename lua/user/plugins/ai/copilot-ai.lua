local set_desc = require('user.utils.functions').set_keymap_desc
return {
    -- optional cmp, add the entries to cmp list (not using it)
    -- {
    --     'zbirenbaum/copilot-cmp',
    --     -- after = { "copilot.lua" },
    --     dependencies = { 'zbirenbaum/copilot.lua' },
    --     config = function()
    --         require('copilot_cmp').setup()
    --     end,
    -- },

    {
        'CopilotC-Nvim/CopilotChat.nvim',
        event = 'BufReadPre',
        enabled = _G.user.ai.copilot.chat.enable,
        branch = 'canary',
        dependencies = {
            { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
            { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        config = function()
            local chat = require('CopilotChat')
            local select = require('CopilotChat.select')

            -- 'Write commit message for the change with commitizen convention.
            -- Make sure the title has maximum 50 characters and message is wrapped
            -- at 72 characters. Wrap the whole message in code block with language gitcommit.'

            chat.setup({
                -- yank_diff_register = '"',
                -- to allow unnamed register
                -- yank_diff_register = { '"', '+', '*' },
                -- yank_diff_register = '+',
                -- yank_diff_registers = 'unnamedplus',
                auto_follow_cursor = false, -- Follow cursor in chat window
                mappings = {
                    reset = {
                        normal = '<C-r>',
                        insert = '<C-r>',
                    },
                    yank_diff = {
                        --     normal = '<C-y>',
                        --     insert = '<C-y>',
                        register = '+',
                    },
                    accept_diff = {
                        normal = '<C-o>',
                        insert = '<C-o>',
                    },
                },
                -- default prompts
                prompts = {
                    CommitStaged = {
                        prompt = [[Write commit message for the change with commitizen convention.
Choose between ["feat", "fix", "docs", "style", "refactor", "perf", "test", "build", "ci", "chore", "revert"] based on the scope of the change.
Make sure the title has maximum 60 characters and message is wrapped at 72 characters.
Wrap the whole message in code block with language gitcommit.
Also Make sure the subject starts with lowercase and the scope is the app name.
Follow commitlint rules. Add breaking change note only if necessary.
]],
                        -- INTELLIJ commit message prompt
                        -- Avoid overly verbose descriptions or unnecessary details.
                        -- Start with a short sentence in imperative form, no more than 50 characters long.
                        -- Then leave an empty line and continue with a more detailed explanation.
                        -- Write only one sentence for the first part, and two or three sentences at most for the detailed explanation.
                        selection = function(source)
                            return select.gitdiff(source, true)
                        end,
                    },
                },
            })

            vim.keymap.set(
                'n',
                '<leader>md',
                '<cmd>CopilotChatToggle<cr>',
                set_desc('Copilot Chat')
            )

            -- See Commands section for default commands if you want to lazy load on them
            --         Commands
            --
            --     :CopilotChat <input>? - Open chat window with optional input
            --     :CopilotChatOpen - Open chat window
            --     :CopilotChatClose - Close chat window
            --     :CopilotChatToggle - Toggle chat window
            --     :CopilotChatReset - Reset chat window
            --     :CopilotChatSave <name>? - Save chat history to file
            --     :CopilotChatLoad <name>? - Load chat history from file
            --     :CopilotChatDebugInfo - Show debug information
            --
            -- Commands coming from default prompts
            --
            --     :CopilotChatExplain - Explain how it works
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mce',
                '<cmd>CopilotChatExplain<cr>',
                set_desc('Copilot Explain')
            )
            --     :CopilotChatTests - Briefly explain how selected code works then generate unit tests
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mct',
                '<cmd>CopilotChatTests<cr>',
                set_desc('Copilot Tests')
            )
            --     :CopilotChatFix - There is a problem in this code. Rewrite the code to show it with the bug fixed.
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mcf',
                '<cmd>CopilotChatFix<cr>',
                set_desc('Copilot Fix')
            )
            --     :CopilotChatOptimize - Optimize the selected code to improve performance and readablilty.
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mco',
                '<cmd>CopilotChatOptimize<cr>',
                set_desc('Copilot Optimize')
            )
            --     :CopilotChatDocs - Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mcd',
                '<cmd>CopilotChatDocs<cr>',
                set_desc('Copilot Docs')
            )
            --     :CopilotChatFixDiagnostic - Please assist with the following diagnostic issue in file
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>mci',
                '<cmd>CopilotChatFixDiagnostic<cr>',
                set_desc('Copilot Fix Diagnostics')
            )
            --     :CopilotChatCommit - Write commit message for the change with commitizen convention
            vim.keymap.set(
                'n',
                '<leader>mcc',
                '<cmd>CopilotChatCommit<cr>',
                set_desc('Copilot Commit')
            )
            --     :CopilotChatCommitStaged - Write commit message for the change with commitizen convention
            vim.keymap.set(
                'n',
                '<leader>ms',
                '<cmd>CopilotChatCommitStaged<cr>',
                set_desc('Copilot Write Commit')
            )

            vim.keymap.set('v', '<leader>mca', function()
                -- ask for user input
                local input = vim.fn.input('Question: ')
                -- call the command with the input
                -- pass the visual lines
                chat.ask(input)
            end, set_desc('Copilot Ask'))

            vim.keymap.set('n', '<leader>mca', function()
                -- ask for user input
                local input = vim.fn.input('Question: ')
                -- call the command with the input
                -- pass the visual lines
                chat.ask(input)
            end, set_desc('Copilot Ask'))
        end,
    },

    {
        'zbirenbaum/copilot.lua', -- config in its own file
        -- cmd = "Copilot",
        dependencies = {},
        enabled = _G.user.ai.copilot.chat.enable,
        build = ':Copilot auth',
        event = 'InsertEnter',
        keys = {
            {
                '<leader>mm',
                "<cmd>lua require('copilot.panel').open()<cr>",
                'n',
                desc = 'Copilot Open Panel',
            },
        },
        config = function()
            local ok, copilot = pcall(require, 'copilot')
            if not ok then
                return
            end
            copilot.setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                    keymap = {
                        jump_next = '<M-n>',
                        jump_prev = '<M-p>',
                        accept = '<C-l>',
                        refresh = 'r',
                        open = '<M-CR>',
                    },
                    layout = {
                        position = 'right', -- bottom | top | left | right
                        ratio = 0.4,
                    },
                },
                suggestion = {
                    enabled = _G.user.ai.autocomplete == 'copilot',
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        -- accept = '<c-l>',
                        accept = '<C-l>',
                        accept_word = false,
                        accept_line = false,
                        next = '<M-n>',
                        prev = '<M-p>',
                        dismiss = '<C-e>',
                    },
                },
                filetypes = {
                    -- yaml = false,
                    -- markdown = false,
                    -- help = false,
                    -- gitcommit = false,
                    -- gitrebase = false,
                    -- hgcommit = false,
                    -- svn = false,
                    -- cvs = false,
                    ['*'] = true,
                    ['.env'] = false,
                    ['.zshenv'] = false,
                },
            })
        end,
    },
}
