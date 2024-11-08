local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'yioneko/nvim-vtsls',
    enabled = _G.user.lsp.tsserver == 'vtsls',
    event = 'BufReadPre',
    -- OPTIONAL
    config = function()
        require('vtsls').config({
            -- customize handlers for commands
            -- handlers = {
            --     source_definition = function(err, locations) end,
            --     file_references = function(err, locations) end,
            --     code_action = function(err, actions) end,
            -- },
            -- automatically trigger renaming of extracted symbol
            refactor_auto_rename = true,
            -- refactor_move_to_file = {
            --     -- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
            --     -- the opts for telescope picker.
            --     telescope_opts = function(items, default) end,
            -- },
        })

        -- require('vtsls').commands[any_command_name](bufnr, on_resolve, on_reject)
        -- require('vtsls').commands.goto_source_definition(winnr, on_resolve, on_reject) -- goto_source_definition requires winnr
        -- require('vtsls').rename(old_name, new_name, on_resolve, on_reject) -- rename file or folder
        --
        -- -- These callbacks are useful if you want to promisify the command functions to write async code.
        -- function on_resolve() end -- after handler called
        -- function on_reject(msg_or_err) end -- in case any error happens

        -- Commands
        -- restart_tsserver	This not restart vtsls itself, but restart the underlying tsserver.
        -- open_tsserver_log	It will open prompt if logging has not been enabled.
        -- reload_projects
        -- select_ts_version	Select version of ts either from workspace or global.
        -- goto_project_config	Open tsconfig.json.
        -- goto_source_definition	Go to the source definition instead of typings.
        -- file_references	Show references of the current file.
        -- rename_file	Rename the current file and update all the related paths in the project.
        -- organize_imports
        -- sort_imports
        -- remove_unused_imports
        -- fix_all
        -- remove_unused
        -- add_missing_imports
        -- source_actions	Pick applicable source actions (same as above)
        vim.keymap.set(
            'n',
            '<leader>ta',
            '<cmd>VtsExec add_missing_imports<cr>',
            set_desc('add missing imports')
        )
        vim.keymap.set(
            'n',
            '<leader>ti',
            '<cmd>VtsExec remove_unused_imports<cr>',
            set_desc('remove unused imports')
        )
        vim.keymap.set(
            'n',
            '<leader>tj',
            '<cmd>VtsExec source_actions<cr>',
            set_desc('source actions')
        )
        vim.keymap.set(
            'n',
            '<C-x>',
            '<cmd>VtsExec source_actions<cr>',
            set_desc('source actions')
        )
        vim.keymap.set(
            'n',
            '<leader>tk',
            '<cmd>VtsExec remove_unused<cr>',
            set_desc('remove unused')
        )
        -- rename file
        vim.keymap.set(
            'n',
            '<leader>tR',
            '<cmd>VtsExec rename_file<cr>',
            set_desc('rename file')
        )
        vim.keymap.set(
            'n',
            '<leader>tX',
            '<cmd>VtsExec restart_tsserver<cr>',
            set_desc('restart tsserver')
        )
        vim.keymap.set(
            'n',
            '<leader>to',
            '<cmd>VtsExec fix_all<cr>',
            set_desc('fix all')
        )
    end,
}
