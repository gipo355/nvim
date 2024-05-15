return {
    {
        'ray-x/go.nvim',
        enabled = _G.user.enable_go_plugin,
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup({
                disable_defaults = true,
                -- go = 'go',
                -- lsp_inlay_hints = {
                --     enable = false,
                -- }, -- using built in
                -- lsp_codelens = false,

                dap_debug = true,
                dap_debug_keymap = true,
                dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

                dap_port = 38697, -- can be set to a number, if set to -1 go.nvim will pick up a random port
                dap_timeout = 15, --  see dap option initialize_timeout_sec = 15,
                dap_retries = 20, -- see dap option max_retries
            })
        end,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod', 'gowork', 'tmpl', 'templ' },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },

    -- golang templ
    -- "joerdav/templ.vim",
}
