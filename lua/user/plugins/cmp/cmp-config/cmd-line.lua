local cmp = require('cmp')
local types = require('luasnip.util.types')

local M = {}

M['/'] = function()
    return {
        mapping = cmp.mapping.preset.cmdline({
            ['<Down>'] = {
                c = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
            },
            ['<Up>'] = {
                c = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
            },
        }),
        sources = {
            { name = 'buffer' },
        },
        -- Display a cursor-like placeholder in unvisited nodes
        -- of the snippet.
        ext_opts = {
            [types.insertNode] = {
                unvisited = {
                    virt_text = { { '|', 'Conceal' } },
                    virt_text_pos = 'inline',
                },
            },
        },
    }
end

M[':'] = function()
    return {
        mapping = cmp.mapping.preset.cmdline({
            ['<Down>'] = {
                c = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
            },
            ['<Up>'] = {
                c = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
            },
        }),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' },
                },
            },
        }),
    }
end

return M
