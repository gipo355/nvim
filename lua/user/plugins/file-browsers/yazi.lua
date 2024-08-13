return {
    'mikavilpas/yazi.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    -- event = 'VeryLazy',
    lazy = false,
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            -- '<leader>-',
            '-',
            function()
                require('yazi').yazi()
            end,
            desc = 'Open the file manager',
        },
        {
            -- Open in the current working directory
            -- '<leader>cw',
            '<leader>-',
            function()
                require('yazi').yazi(nil, vim.fn.getcwd())
            end,
            desc = "Open the file manager in nvim's working directory",
        },
    },
    ---@type YaziConfig
    opts = {
        -- open_for_directories = false,
        use_ya_for_events_reading = true,
        use_yazi_client_id_flag = true,
        open_multiple_tabs = true,
        open_for_directories = true,
    },
    -- config = function(opts)
    --     -- require('yazi').setup(opts)
    --
    --     print(vim.inspect(opts))
    --
    --     -- require('yazi').setup(self, opts)
    --
    --     -- require('yazi').setup({
    --     --     {
    --     --         -- open_for_directories = false,
    --     --         use_ya_for_events_reading = true,
    --     --         use_yazi_client_id_flag = true,
    --     --         open_multiple_tabs = true,
    --     --         open_for_directories = true,
    --     --     },
    --     -- })
    -- end,
}
