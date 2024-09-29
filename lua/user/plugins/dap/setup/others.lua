return {
    {
        -- :DapInstall node2 NEEDED, instead of :MasonInstall node-debug2-adapter
        -- :DapInstall delve ( for go ) NOT NEEDED,  nvim-dap-go sets up everything: requires dlv in path
        -- :DapInstall js (vscode-js-debug) NOT NEEDED, plugin nvim-dap-vscode-js automatically and built
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },
        config = function()
            require('mason-nvim-dap').setup()
        end,
    },

    {
        'theHamsta/nvim-dap-virtual-text',
        event = 'VeryLazy',
        config = function()
            require('nvim-dap-virtual-text').setup()
        end,
    },

    { 'mfussenegger/nvim-dap', event = 'VeryLazy' },

    {
        'rcarriga/nvim-dap-ui',
        event = 'BufReadPre',
    },
}
