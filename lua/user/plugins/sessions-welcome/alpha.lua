local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        -- alternative to shatur/neovim-session-manager and persistence and possession
        'Shatur/neovim-session-manager',
    },
    lazy = false,
    enabled = _G.user.alpha.enable,
    priority = 1000,
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
        if _G.user.alpha.type == 'dashboard' then
            require('user.plugins.sessions-welcome.alpha-config.dashboard')
        end
        if _G.user.alpha.type == 'startify' then
            require('alpha').setup(require('alpha.themes.startify').config)
        end

        if _G.user.alpha.type == 'theta' then
            require('alpha').setup(require('alpha.themes.theta').config)
        end

        vim.keymap.set('n', '<leader>J', '<cmd>Alpha<cr>', set_desc('Alpha'))
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
