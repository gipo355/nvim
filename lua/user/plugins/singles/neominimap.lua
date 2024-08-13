return {
    'Isrothy/neominimap.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- Recommended
    },
    enabled = _G.user.neominimap.enable,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    -- keys = {
    --     { '<leader>nt', '<cmd>Neominimap toggle<cr>', desc = 'Toggle minimap' },
    --     { '<leader>no', '<cmd>Neominimap on<cr>', desc = 'Enable minimap' },
    --     { '<leader>nc', '<cmd>Neominimap off<cr>', desc = 'Disable minimap' },
    --     {
    --         '<leader>nf',
    --         '<cmd>Neominimap focus<cr>',
    --         desc = 'Focus on minimap',
    --     },
    --     {
    --         '<leader>nu',
    --         '<cmd>Neominimap unfocus<cr>',
    --         desc = 'Unfocus minimap',
    --     },
    --     {
    --         '<leader>ns',
    --         '<cmd>Neominimap toggleFocus<cr>',
    --         desc = 'Focus on minimap',
    --     },
    --     {
    --         '<leader>nwt',
    --         '<cmd>Neominimap winToggle<cr>',
    --         desc = 'Toggle minimap for current window',
    --     },
    --     {
    --         '<leader>nwr',
    --         '<cmd>Neominimap winRefresh<cr>',
    --         desc = 'Refresh minimap for current window',
    --     },
    --     {
    --         '<leader>nwo',
    --         '<cmd>Neominimap winOn<cr>',
    --         desc = 'Enable minimap for current window',
    --     },
    --     {
    --         '<leader>nwc',
    --         '<cmd>Neominimap winOff<cr>',
    --         desc = 'Disable minimap for current window',
    --     },
    --     {
    --         '<leader>nwt',
    --         '<cmd>Neominimap winOn<cr>',
    --         desc = 'Enable minimap for current window',
    --     },
    --     {
    --         '<leader>nbt',
    --         '<cmd>Neominimap bufToggle<cr>',
    --         desc = 'Toggle minimap for current buffer',
    --     },
    --     {
    --         '<leader>nbr',
    --         '<cmd>Neominimap bufRefresh<cr>',
    --         desc = 'Refresh minimap for current buffer',
    --     },
    --     {
    --         '<leader>nbo',
    --         '<cmd>Neominimap bufOn<cr>',
    --         desc = 'Enable minimap for current buffer',
    --     },
    --     {
    --         '<leader>nbc',
    --         '<cmd>Neominimap bufOff<cr>',
    --         desc = 'Disable minimap for current buffer',
    --     },
    -- },
    init = function()
        vim.opt.wrap = false -- Recommended
        vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
        vim.g.neominimap = {
            auto_enable = true,
            diagnostic = {
                enabled = true,
                severity = vim.diagnostic.severity.ERROR,
            },
            window_border = 'none',
            minimap_width = 7,
            -- Minimap will not be created for buffers of these types
            exclude_buftypes = {
                'oil',
                'nofile',
                'nowrite',
                'quickfix',
                'terminal',
                'prompt',
            },
        }
    end,
}
