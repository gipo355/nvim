return {
    'kkoomen/vim-doge',
    event = 'BufReadPre',
    build = ':call doge#install()',
    keys = {
        {
            '<leader>vG',
            '<cmd>DogeGenerate<cr>',
            'n',
            desc = 'generate type docs',
        },
    },
    config = function()
        vim.g.doge_enable_mappings = 0
        -- vim.g.doge_javascript_settings = {
        -- destructuring_props = 0,
        -- omit_redunant_param_types = 1,
        -- }
    end,
}
