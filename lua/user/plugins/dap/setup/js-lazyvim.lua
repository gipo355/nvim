-- can add the same plugin twice with different configurations
-- they get merged together
-- https://www.reddit.com/r/neovim/comments/18ukebs/lazyvim_dap_and_launching_chrome/
return {
    'mfussenegger/nvim-dap',
    optional = true,
    dependencies = {
        {
            'williamboman/mason.nvim',
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, 'js-debug-adapter')
            end,
        },
    },
    opts = function()
        local dap = require('dap')
        if not dap.adapters['pwa-node'] then
            require('dap').adapters['pwa-node'] = {
                type = 'server',
                host = '127.0.0.1',
                port = '${port}',
                executable = {
                    command = 'node',
                    -- 💀 Make sure to update this path to point to your installation
                    args = {
                        require('mason-registry')
                            .get_package('js-debug-adapter')
                            :get_install_path()
                            .. '/js-debug/src/dapDebugServer.js',
                        '${port}',
                    },
                },
            }
        end
        if not dap.adapters['pwa-chrome'] then
            dap.adapters['pwa-chrome'] = {
                type = 'server',
                host = 'localhost',
                port = '${port}',
                executable = {
                    command = 'node',
                    args = {
                        require('mason-registry')
                            .get_package('js-debug-adapter')
                            :get_install_path()
                            .. '/js-debug/src/dapDebugServer.js',
                        '${port}',
                    },
                },
            }
        end
        for _, lang in ipairs({
            'typescript',
            'javascript',
            'typescriptreact',
            'javascriptreact',
        }) do
            if not dap.configurations[lang] then
                dap.configurations[lang] = {
                    {
                        type = 'pwa-chrome',
                        request = 'launch',
                        name = 'Launch Chrome 4200',
                        url = 'http://localhost:4200',
                        sourceMaps = true,
                        webRoot = '${workspaceFolder}/src',
                        runtimeArgs = {
                            '--remote-debugging-port=9222',
                        },
                    },
                    {
                        type = 'pwa-chrome',
                        request = 'attach',
                        name = 'attach Chrome 4200',
                        port = 9222,
                        sourceMaps = true,
                        protocol = 'inspector',
                        webRoot = '${workspaceFolder}/src',
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
                }
            end
        end
    end,
}
