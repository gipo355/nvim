-- [[ more configs at https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Dotnet ]]
local icons = require('user.utils.icons')
-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    -- NOTE: And you can specify dependencies as well
    dependencies = {

        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',

        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-dap.nvim',
        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
    },
    config = function()
        pcall(require('telescope').load_extension('dap'))

        local dap = require('dap')
        local dapui = require('dapui')
        local telescope_dap = require('telescope').extensions.dap

        local dap_config = {
            breakpoint = {
                text = icons.ui.Bug,
                texthl = 'DiagnosticSignError',
                linehl = '',
                numhl = '',
            },
            breakpoint_rejected = {
                text = icons.ui.Bug,
                texthl = 'DiagnosticSignError',
                linehl = '',
                numhl = '',
            },
            stopped = {
                text = icons.ui.BoldArrowRight,
                texthl = 'DiagnosticSignWarn',
                linehl = 'Visual',
                numhl = 'DiagnosticSignWarn',
            },
        }

        if _G.user.have_nerd_font then
            vim.fn.sign_define('DapBreakpoint', dap_config.breakpoint)
            vim.fn.sign_define(
                'DapBreakpointRejected',
                dap_config.breakpoint_rejected
            )
            vim.fn.sign_define('DapStopped', dap_config.stopped)
        end

        require('mason-nvim-dap').setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'delve',
            },
        })

        -- TODO: lvim keymaps, dap and dapui config

        -- Basic debugging keymaps, feel free to change to your liking!
        -- vim.keymap.set(
        --     'n',
        --     '<F5>',
        --     dap.continue,
        --     { desc = 'Debug: Start/Continue' }
        -- )
        -- vim.keymap.set(
        --     'n',
        --     '<F1>',
        --     dap.step_into,
        --     { desc = 'Debug: Step Into' }
        -- )
        -- vim.keymap.set(
        --     'n',
        --     '<F2>',
        --     dap.step_over,
        --     { desc = 'Debug: Step Over' }
        -- )
        -- vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        -- vim.keymap.set(
        --     'n',
        --     '<leader>b',
        --     dap.toggle_breakpoint,
        --     { desc = 'Debug: Toggle Breakpoint' }
        -- )
        -- vim.keymap.set('n', '<leader>B', function()
        --     dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        -- end, { desc = 'Debug: Set Breakpoint' })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup({
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        })

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set(
            'n',
            '<F7>',
            dapui.toggle,
            { desc = 'Debug: See last session result.' }
        )

        vim.keymap.set(
            'n',
            '<leader>dk',
            '<cmd>DapTerminate<cr>',
            { desc = '[d]ap [k]ill' }
        )

        vim.keymap.set(
            'n',
            '<leader>dI',
            telescope_dap.list_breakpoints,
            { desc = '[d]ap l[i]st breakpoints' }
        )
        vim.keymap.set(
            'n',
            '<leader>dv',
            telescope_dap.variables,
            { desc = '[d]ap [v]ariables' }
        )
        vim.keymap.set(
            'n',
            '<leader>dF',
            telescope_dap.frames,
            { desc = '[d]ap [f]rames' }
        )
        vim.keymap.set(
            'n',
            '<leader>dT',
            dap.clear_breakpoints,
            { desc = '[d]ap clear all breakpoints' }
        )
        vim.keymap.set(
            'n',
            '<leader>dt',
            dap.toggle_breakpoint,
            { desc = '[d]ap [t]oggle breakpoint' }
        )
        vim.keymap.set(
            'n',
            '<leader>db',
            dap.step_back,
            { desc = '[d]ap [b]ack' }
        )
        vim.keymap.set(
            'n',
            '<leader>dc',
            dap.continue,
            { desc = '[d]ap [c]ontinue' }
        )
        vim.keymap.set(
            'n',
            '<leader>dC',
            dap.run_to_cursor,
            { desc = '[d]ap [C]ursor' }
        )
        vim.keymap.set(
            'n',
            '<leader>dd',
            dap.disconnect,
            { desc = '[d]ap [d]isconnect' }
        )
        vim.keymap.set(
            'n',
            '<leader>dg',
            dap.session,
            { desc = '[d]ap [g]et session' }
        )
        vim.keymap.set(
            'n',
            '<leader>di',
            dap.step_into,
            { desc = '[d]ap [i]nto' }
        )
        vim.keymap.set(
            'n',
            '<leader>do',
            dap.step_over,
            { desc = '[d]ap [o]ver' }
        )
        vim.keymap.set('n', '<leader>du', dap.step_out, { desc = '[d]ap [u]t' })
        vim.keymap.set('n', '<leader>dp', dap.pause, { desc = '[d]ap [p]ause' })
        vim.keymap.set(
            'n',
            '<leader>dr',
            dap.repl.toggle,
            { desc = '[d]ap [r]epl' }
        )
        vim.keymap.set(
            'n',
            '<leader>ds',
            dap.continue,
            { desc = '[d]ap [s]tart' }
        )
        vim.keymap.set('n', '<leader>dq', dap.close, { desc = '[d]ap [q]uit' })
        vim.keymap.set('n', '<leader>dU', dapui.toggle, { desc = '[d]ap [U]I' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup()

        -- adapters
        require('user.plugins.dap.configs.csharp')

        -- TODO: config dap
    end,
}
