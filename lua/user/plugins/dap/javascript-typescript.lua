return {
    {
        -- [https://github.com/anasrar/.dotfiles/blob/4c444c3ab2986db6ca7e2a47068222e47fd232e2/neovim/.config/nvim/lua/rin/DAP/languages/typescript.lua]
        -- [https://www.reddit.com/r/neovim/comments/zygqnn/do_you_have_typescript_debugging_working_with/]
        --
        -- required manual install: https://github.com/microsoft/vscode-js-debug?? no, used plugin as dependency below
        -- https://github.com/mxsdev/nvim-dap-vscode-js

        -- requires manual install of the vscode-debug-js
        -- requires installation of :MasonInstall node-debug2-adapter ( use mason nvim dap above )
        'mxsdev/nvim-dap-vscode-js', -- setup at the end in its file and in dap.lua
        -- event = 'BufReadPre',
        ft = {
            'typescript',
            'javascript',
            'typescriptreact',
            'javascriptreact',
        },
        -- opts = {
        --     adapters = {
        --         'pwa-node',
        --         'pwa-chrome',
        --         'pwa-msedge',
        --         'node-terminal',
        --         'pwa-extensionHost',
        --     },
        --
        --     debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
        --     -- debugger_path = os.getenv('HOME')
        --     --     .. '/.local/share/nvim/lazy/vscode-js-debug',
        -- },
        dependencies = {
            {
                'microsoft/vscode-js-debug',
                -- build = "npm install --legacy-peer-deps && npm run compile",
                build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            },
            -- {
            --     'microsoft/vscode-js-debug',
            --     -- opts = {},
            --     build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            -- },
            'mfussenegger/nvim-dap',
            -- "rcarriga/nvim-dap-ui", -- built in lunarvim
            -- "mfussenegger/nvim-dap-python", -- don't need python
            -- require at the end
            -- config = function()
            --     -- [https://www.reddit.com/r/neovim/comments/zinzqm/recipe_debug_deno_with_microsoftvscodejsdebug/]
            --     require("dap-vscode-js").setup({
            --         -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            --         -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
            --         -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            --         -- debugger_path = vim.fn.stdpath("data")
            --         --     .. "/mason/packages/js-debug-adapter",
            --         -- debugger_cmd = { "js-debug-adapter" },
            --         adapters = {
            --             "pwa-node",
            --             "pwa-chrome",
            --             "pwa-msedge",
            --             "node-terminal",
            --             "pwa-extensionHost",
            --         }, -- which adapters to register in nvim-dap
            --         -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            --         -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            --         -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
            --     })
            -- end,
            -- { "jbyuki/one-small-step-for-vimkind", module = "osv" }, -- requires nlua adapter?????
            -- check dap.lua too
        },
        config = function()
            local _, dapjs = pcall(require, 'dap-vscode-js')
            local dap = require('dap')
            dapjs.setup({
                adapters = {
                    'pwa-node',
                    'pwa-chrome',
                    'pwa-msedge',
                    'node-terminal',
                    'pwa-extensionHost',
                },

                debugger_path = vim.fn.stdpath('data')
                    .. '/lazy/vscode-js-debug',
                -- debugger_path = os.getenv('HOME')
                --     .. '/.local/share/nvim/lazy/vscode-js-debug',
            })

            for _, language in ipairs({
                'typescript',
                'javascript',
                'typescriptreact',
                'javascriptreact',
            }) do
                dap.configurations[language] = {
                    {
                        type = 'pwa-chrome',
                        request = 'launch',
                        name = 'Launch Chrome against localhost vite project',
                        url = 'http://localhost:4200',
                        webRoot = '${workspaceFolder}/src',
                        runtimeArgs = {
                            '--remote-debugging-port=9222',
                        },
                        sourceMaps = true,
                    },
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Launch file',
                        program = '${file}',
                        cwd = '${workspaceFolder}',
                    },
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Launch Deno file',
                        runtimeExecutable = 'deno',
                        runtimeArgs = {
                            'run',
                            '--inspect-wait',
                            '--allow-all',
                        },
                        program = '${file}',
                        cwd = '${workspaceFolder}',
                        attachSimplePort = 9229,
                    },
                    {
                        type = 'pwa-node',
                        request = 'attach',
                        name = 'Attach',
                        processId = require('dap.utils').pick_process,
                        cwd = '${workspaceFolder}',
                    },
                    {
                        type = 'pwa-node',
                        request = 'attach',
                        name = 'Auto Attach Node to --inspect',
                        cwd = vim.fn.getcwd(),
                        protocol = 'inspector',
                    },
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Debug Jest Tests',
                        -- trace = true, -- include debugger info
                        runtimeExecutable = 'node',
                        runtimeArgs = {
                            './node_modules/jest/bin/jest.js',
                            '--runInBand',
                        },
                        rootPath = '${workspaceFolder}',
                        cwd = '${workspaceFolder}',
                        console = 'integratedTerminal',
                        internalConsoleOptions = 'neverOpen',
                    },
                    {
                        type = 'pwa-node',
                        request = 'launch',
                        name = 'Debug Mocha Tests',
                        -- trace = true, -- include debugger info
                        runtimeExecutable = 'node',
                        runtimeArgs = {
                            './node_modules/mocha/bin/mocha.js',
                        },
                        rootPath = '${workspaceFolder}',
                        cwd = '${workspaceFolder}',
                        console = 'integratedTerminal',
                        internalConsoleOptions = 'neverOpen',
                    },
                }
            end
        end,
    },
}
