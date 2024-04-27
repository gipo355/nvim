local set_desc = require('user.utils.functions').set_keymap_desc

return {
    'Shatur/neovim-session-manager',
    event = 'VimEnter',
    config = function()
        local config = require('session_manager.config')
        local session_manager = require('session_manager')
        local function autoload_mode()
            if _G.user.enable_sessions_autoload then
                return config.AutoloadMode.CurrentDir
            end
            return config.AutoloadMode.Disabled
        end
        session_manager.setup({
            autoload_mode = autoload_mode(), -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
            autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                'gitcommit',
                'gitrebase',
            },
        })

        vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
            callback = function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    -- Don't save while there's any 'nofile' buffer open.
                    if
                        vim.api.nvim_get_option_value('buftype', { buf = buf })
                        == 'nofile'
                    then
                        return
                    end
                end
                session_manager.save_current_session()
            end,
        })

        vim.keymap.set(
            'n',
            '<leader>So',
            '<cmd>SessionManager<cr>',
            set_desc('Session Manager')
        )
        vim.keymap.set(
            'n',
            '<leader>Sl',
            '<cmd>SessionManager load_current_dir_session<cr>',
            set_desc('Session Load')
        )
        vim.keymap.set(
            'n',
            '<leader>Sd',
            '<cmd>SessionManager delete_current_dir_session<cr>',
            set_desc('Session Delete Current Dir')
        )
        vim.keymap.set(
            'n',
            '<leader>Ss',
            '<cmd>SessionManager save_current_session<cr>',
            set_desc('Session Save')
        )
    end,
}
