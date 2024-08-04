return {
    'jellydn/hurl.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    ft = 'hurl',
    opts = {
        -- Show debugging info
        debug = false,
        env_file = '.env',
        -- Show notification on run
        show_notification = false,
        -- Show response in popup or split
        mode = 'split',
        -- Default formatter
        formatters = {
            json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
            html = {
                'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                '--parser',
                'html',
            },
            xml = {
                'tidy', -- Make sure you have installed tidy in your system, e.g: brew install tidy-html5
                '-xml',
                '-i',
                '-q',
            },
        },
    },
    keys = {
        -- Run API request
        { '<leader>rA', '<cmd>HurlRunner<CR>', desc = 'Run All requests' },
        { '<leader>ra', '<cmd>HurlRunnerAt<CR>', desc = 'Run Api request' },
        {
            '<leader>re',
            '<cmd>HurlRunnerToEntry<CR>',
            desc = 'Run Api request to entry',
        },
        { '<leader>rm', '<cmd>HurlToggleMode<CR>', desc = 'Hurl Toggle Mode' },
        {
            '<leader>rv',
            '<cmd>HurlVerbose<CR>',
            desc = 'Run Api in verbose mode',
        },
        -- Run Hurl request in visual mode
        {
            '<leader>rh',
            '<cmd>HurlRunner<CR>',
            desc = 'Hurl Runner',
            mode = 'v',
        },

        -- Show last response
        {
            '<leader>rl',
            '<cmd>HurlShowLastResponse<CR>',
            desc = 'Hurl Last Response',
        },
    },
}
