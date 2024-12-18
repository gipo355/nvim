return {
    'hrsh7th/cmp-emoji',
    enabled = _G.user.completion == 'cmp',
    event = 'InsertEnter',
    config = function(_, opts)
        -- extend the sources only if plugin exists
        -- taken from [https://github.com/LazyVim/starter/blob/main/lua/plugins/example.lua]
        -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
        -- TODO: change cmp
        -- local cmp_sources = lvim.builtin.cmp.sources
        -- cmp_sources = vim.tbl_extend('force', cmp_sources, { emoji = true })
    end,
}
