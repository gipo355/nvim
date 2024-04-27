-- navbuddy, must manually clone nvim-navic into plugin folder? lunarvim breadcrumbs disables navic if false
return {
    'SmiteshP/nvim-navbuddy',
    dependencies = {
        'neovim/nvim-lspconfig',
        { 'SmiteshP/nvim-navic', enabled = true },
        'MunifTanjim/nui.nvim',
        'numToStr/Comment.nvim', -- Optional
        'nvim-telescope/telescope.nvim', -- Optional
    },
    keys = {
        {
            '<leader>j',
            '<cmd>Navbuddy<cr>',
            'n',
            { desc = 'NavBuddy' },
        },
    },
    config = function()
        local ok, navbuddy = pcall(require, 'nvim-navbuddy')

        if not ok then
            return
        end

        navbuddy.setup({
            lsp = {
                auto_attach = true,
            },
            icons = {
                File = '󰈙 ',
                Module = ' ',
                Namespace = '󰌗 ',
                Package = ' ',
                Class = '󰌗 ',
                Method = '󰆧 ',
                Property = ' ',
                Field = ' ',
                Constructor = ' ',
                Enum = '󰕘',
                Interface = '󰕘',
                Function = '󰊕 ',
                Variable = '󰆧 ',
                Constant = '󰏿 ',
                String = ' ',
                Number = '󰎠 ',
                Boolean = '◩ ',
                Array = '󰅪 ',
                Object = '󰅩 ',
                Key = '󰌋 ',
                Null = '󰟢 ',
                EnumMember = ' ',
                Struct = '󰌗 ',
                Event = ' ',
                Operator = '󰆕 ',
                TypeParameter = '󰊄 ',
            },
        })
    end,
}
