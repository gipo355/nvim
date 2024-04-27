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
            require('CopilotChat').setup()
            vim.keymap.set(
                'n',
                '<leader>md',
                '<cmd>CopilotChatToggle<cr>',
                set_desc('CopilotChat toggle')
            )
        end,
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
            set_desc('CopilotChat explain')
        ),
        --     :CopilotChatTests - Briefly explain how selected code works then generate unit tests
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mct',
            '<cmd>CopilotChatTests<cr>',
            set_desc('CopilotChat tests')
        ),
        --     :CopilotChatFix - There is a problem in this code. Rewrite the code to show it with the bug fixed.
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mcf',
            '<cmd>CopilotChatFix<cr>',
            set_desc('CopilotChat fix')
        ),
        --     :CopilotChatOptimize - Optimize the selected code to improve performance and readablilty.
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mco',
            '<cmd>CopilotChatOptimize<cr>',
            set_desc('CopilotChat optimize')
        ),
        --     :CopilotChatDocs - Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mcd',
            '<cmd>CopilotChatDocs<cr>',
            set_desc('CopilotChat docs')
        ),
        --     :CopilotChatFixDiagnostic - Please assist with the following diagnostic issue in file
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>mci',
            '<cmd>CopilotChatFixDiagnostic<cr>',
            set_desc('CopilotChat fix diagnostic')
        ),
        --     :CopilotChatCommit - Write commit message for the change with commitizen convention
        vim.keymap.set(
            'n',
            '<leader>mcc',
            '<cmd>CopilotChatCommit<cr>',
            set_desc('CopilotChat commit')
        ),
        --     :CopilotChatCommitStaged - Write commit message for the change with commitizen convention
        vim.keymap.set(
            'n',
            '<leader>mcs',
            '<cmd>CopilotChatCommitStaged<cr>',
            set_desc('CopilotChat commit staged')
        ),
    },

    {
        'zbirenbaum/copilot.lua', -- config in its own file
        -- cmd = "Copilot",
        dependencies = {},
        build = ':Copilot auth',
        event = 'InsertEnter',
        keys = {
            {
                '<leader>mm',
                "<cmd>lua require('copilot.panel').open()<cr>",
                'n',
                desc = 'copilot panel',
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
                    enabled = true,
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
