local set_desc = require('user.utils.functions').set_keymap_desc

-- NOTE: must be able to comment jsx
-- https://github.com/neovim/neovim/issues/28830

return {
    -- { 'JoosepAlviste/nvim-ts-context-commentstring', event = 'BufReadPre' },

    {
        'folke/ts-comments.nvim',
        opts = {},
        event = 'VeryLazy',
        -- enabled = vim.fn.has('nvim-0.10.0') == 1,
    },

    -- IMP: using mini.comment in mini file

    -- doesn't work with jsx
    -- {
    --     'numToStr/Comment.nvim',
    --     event = 'BufReadPre',
    --     opts = {},
    --     config = function()
    --         -- local get_option = vim.filetype.get_option
    --         -- vim.filetype.get_option = function(filetype, option)
    --         --     return option == 'commentstring'
    --         --             and require('ts_context_commentstring.internal').calculate_commentstring()
    --         --         or get_option(filetype, option)
    --         -- end
    --
    --         local comment = require('Comment')
    --         comment.setup()
    --         -- vim.keymap.set(
    --         --     'n',
    --         --     '<M-/>',
    --         --     "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
    --         --     opts
    --         -- )
    --         vim.keymap.set(
    --             { 'n', 'v' },
    --             '<leader>/',
    --             '<Plug>(comment_toggle_linewise_current)',
    --             set_desc('comment')
    --         )
    --         vim.keymap.set(
    --             { 'v' },
    --             '<leader>/',
    --             '<Plug>(comment_toggle_linewise_visual)',
    --             set_desc('comment')
    --         )
    --     end,
    -- },
}
