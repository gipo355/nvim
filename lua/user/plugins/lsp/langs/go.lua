return {
    {
        'ray-x/go.nvim',
        dependencies = { -- optional packages
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            require('go').setup({
                lsp_inlay_hints = { enable = false }, -- using built in
            })
        end,
        event = { 'CmdlineEnter' },
        ft = { 'go', 'gomod', 'gowork', 'tmpl', 'templ' },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },

    -- golang templ
    -- "joerdav/templ.vim",
}
