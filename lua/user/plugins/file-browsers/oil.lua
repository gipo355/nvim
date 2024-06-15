-- unplugged because using mini.files and netrw.nvim
return {
    'stevearc/oil.nvim',
    event = 'VimEnter',
    enabled = false,
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('oil').setup({
            -- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
            delete_to_trash = true,
            trash_command = 'trash-put',
            view_options = {
                show_hidden = true,
            },
            columns = {
                'icon',
                'permissions',
                'size',
                -- 'mtime',
            },
        })
        vim.keymap.set(
            'n',
            '-',
            '<CMD>Oil<CR>',
            { desc = 'Open parent directory' }
        )
    end,
}
