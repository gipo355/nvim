return {
    {
        'gipo355/nx.nvim',

        dependencies = {
            'nvim-telescope/telescope.nvim',
        },

        opts = {
            -- See below for config options
            nx_cmd_root = 'npx nx',
        },

        -- Plugin will load when you use these keys
        -- run_many
        -- affected
        -- external_generators
        -- workspace_generators
        keys = {
            {
                '<leader>Nx',
                '<cmd>Telescope nx actions<CR>',
                desc = 'nx actions',
            },
            {
                '<leader>Ng',
                '<cmd>Telescope nx generators<CR>',
                desc = 'nx generators',
            },
            {
                '<leader>Nr',
                '<cmd>Telescope nx run_many<CR>',
                desc = 'nx run_many',
            },
            {
                '<leader>Na',
                '<cmd>Telescope nx affected<CR>',
                desc = 'nx affected',
            },
            {
                '<leader>Ne',
                '<cmd>Telescope nx external_generators<CR>',
                desc = 'nx external_generators',
            },
            {
                '<leader>Nw',
                '<cmd>Telescope nx workspace_generators<CR>',
                desc = 'nx workspace_generators',
            },
        },
    },
}
