local set_desc = require('user.utils.functions').set_keymap_desc

return {
    -- style markdown files
    'MeanderingProgrammer/markdown.nvim',
    event = 'BufReadPre',
    ft = 'markdown',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        require('render-markdown').setup({})

        vim.keymap.set(
            'n',
            '<leader>ha',
            '<cmd>RenderMarkdownToggle<CR>',
            set_desc('Markdown render toggle')
        )
    end,
}
