-- unplugged because using mini.files and netrw.nvim
return {
    'stevearc/oil.nvim',
    event = 'VimEnter',
    enabled = _G.user.oil.enable,
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('oil').setup({
            -- vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
            delete_to_trash = true,
            -- trash_command = 'trash-put',
            default_file_explorer = true,
            skip_confirm_for_simple_edits = false,
            lsp_file_methods = {
                -- Time to wait for LSP file operations to complete before skipping
                timeout_ms = 1000,
                -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                -- Set to "unmodified" to only save unmodified buffers
                autosave_changes = true,
            },
            watch_for_changes = true,
            keymaps = {
                ['g?'] = 'actions.show_help',
                ['<CR>'] = 'actions.select',
                ['<C-s>'] = {
                    'actions.select',
                    opts = { vertical = true },
                    desc = 'Open the entry in a vertical split',
                },
                ['<C-h>'] = {
                    'actions.select',
                    opts = { horizontal = true },
                    desc = 'Open the entry in a horizontal split',
                },
                ['<C-t>'] = {
                    'actions.select',
                    opts = { tab = true },
                    desc = 'Open the entry in new tab',
                },
                ['<C-p>'] = 'actions.preview',
                ['<C-c>'] = 'actions.close',
                ['<C-l>'] = 'actions.refresh',
                ['-'] = 'actions.parent',
                ['_'] = 'actions.open_cwd',
                ['`'] = 'actions.cd',
                ['~'] = {
                    'actions.cd',
                    opts = { scope = 'tab' },
                    desc = ':tcd to the current oil directory',
                },
                ['gs'] = 'actions.change_sort',
                ['gx'] = 'actions.open_external',
                ['g.'] = 'actions.toggle_hidden',
                ['g\\'] = 'actions.toggle_trash',
            },
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
            '=',
            '<CMD>Oil<CR>',
            { desc = 'Open parent directory' }
        )
    end,
}
