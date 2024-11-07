local set_desc = require('user.utils.functions').set_keymap_desc

return {
    -- style markdown files
    'MeanderingProgrammer/markdown.nvim',
    enabled = _G.user.additional_plugins.markdown_styling,
    event = 'BufReadPre',
    ft = { 'markdown', 'Avante' },
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },

    config = function()
        require('render-markdown').setup({
            file_types = { 'markdown', 'Avante' },
        })

        vim.keymap.set(
            'n',
            '<leader>ha',
            '<cmd>RenderMarkdownToggle<CR>',
            set_desc('Markdown render toggle')
        )
    end,
}
