return {
    'kevinhwang91/rnvimr',
    cmd = 'RnvimrToggle',
    enabled = _G.user.additional_plugins.ranger,
    -- TODO: plugins lazy loaded won't load keymaps in config fn untill they are called
    -- either add the keymaps in the keys prop or in the init fn
    keys = {
        {
            '<leader>R',
            '<cmd>RnvimrToggle<cr>',
            'n',
            desc = 'toggle rnvimr',
        },
    },
    config = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
        -- vim.g.rnvimr_action = {
        --     ['<C-f>'] = ':fzf_select'
        -- }

        -- vim.keymap.set(
        --     'n',
        --     '<leader>r',
        --     '<cmd>RnvimrToggle<cr>',
        --     { desc = 'toggle rnvimr' }
        -- )
    end,
}

-- Alternative
-- {
--   "kelly-lin/ranger.nvim",
--   config = function()
--     require("ranger-nvim").setup({ replace_netrw = true })
--     vim.api.nvim_set_keymap("n", "<leader>ef", "", {
--       noremap = true,
--       callback = function()
--         require("ranger-nvim").open(true)
--       end,
--     })
--   end,
-- }
