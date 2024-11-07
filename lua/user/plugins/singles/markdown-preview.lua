-- preview markdown with :MarkdownPreview :MarkdownPreviewStop ( in browser )
return {
    'iamcco/markdown-preview.nvim',
    enabled = _G.user.additional_plugins.markdown_preview,
    event = 'BufReadPre',
    keys = {
        {
            '<leader>hm',
            '<cmd>MarkdownPreviewToggle<cr>',
            'n',
            desc = 'Markdown preview',
        },
    },
    cmd = {
        'MarkdownPreviewToggle',
        'MarkdownPreview',
        'MarkdownPreviewStop',
    },
    build = 'cd app && yarn install',
    init = function()
        vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
}
