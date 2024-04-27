local set_desc = require('user.utils.functions').set_keymap_desc
-- enhance buildint netrw directory browser / explorer :Lexplore
-- not needed with oil.nvim
return {
    'prichrd/netrw.nvim',
    dependencies = {
        { 'tpope/vim-vinegar' },
    },
    config = function()
        require('netrw').setup()
        -- vim.g.netrw_liststyle = 3
        vim.keymap.set('n', '-', '<cmd>Explore<cr>', set_desc('Netrw'))
    end,
}
