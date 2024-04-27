local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        -- alternative to shatur/neovim-session-manager and persistence and possession
        'Shatur/neovim-session-manager',
    },
    event = 'VimEnter',
    -- keys = {
    --     {
    --         '<leader>;',
    --         '<cmd>Alpha<cr>',
    --         'n',
    --         desc = 'Alpha',
    --     },
    --     {
    --         '<leader>Ss',
    --         '<cmd>SessionManager<cr>',
    --         'n',
    --         desc = 'Session Manager',
    --     },
    -- },
    config = function()
        require('alpha').setup(require('alpha.themes.startify').config)
        -- require('alpha').setup(require('alpha.themes.dashboard').config)
        vim.keymap.set('n', '<leader>;', '<cmd>Alpha<cr>', set_desc('Alpha'))
    end,
}
--     {
--     {
--         'goolord/alpha-nvim',
--         event = 'VimEnter',
--         -- config = function()
--         --     require('alpha').setup()
--         -- end,
--     },
-- }
