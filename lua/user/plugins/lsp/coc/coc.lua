-- only for tsserver
-- check typescript-tools todos
return {
    'neoclide/coc.nvim',
    enabled = _G.user.lsp.tsserver == 'coc',
    build = 'pnpm install',
    event = 'BufReadPre',
    dependencies = {
        'neoclide/coc-tsserver',
    },
}
