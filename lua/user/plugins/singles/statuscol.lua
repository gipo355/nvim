-- gutter sign column
return {
    'luukvbaal/statuscol.nvim',
    event = 'BufReadPre',
    config = function()
        local builtin = require('statuscol.builtin')
        require('statuscol').setup({
            foldfunc = 'builtin',
            setopt = true,
            relculright = true,
            ft_ignore = {
                'oil',
                'aerial',
            },
            segments = {
                -- { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
                -- { text = { "%s" },                  click = "v:lua.ScSa" },
                -- { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },

                -- { text = { '%s' }, click = 'v:lua.ScSa' },
                {
                    click = 'v:lua.ScSa',
                    sign = {
                        namespace = { 'gitsign' },
                        maxwidth = 1,
                        -- colwidth = 2,
                        fillchar = ' ',
                        wrap = false,
                        fillcharhl = nil,
                        auto = false,
                    },
                },
                {
                    click = 'v:lua.ScSa',
                    sign = {
                        name = { '.*' },
                        text = { '.*' },
                        namespace = { '.*' },
                        maxwidth = 1,
                        -- colwidth = 2,
                        fillchar = ' ',
                        wrap = false,
                        fillcharhl = nil,
                        auto = false,
                    },
                },

                -- {
                --     sign = {
                --         name = { "Diagnostic" },
                --         maxwidth = 1,
                --         auto = false,
                --     },
                --     click = "v:lua.ScSa",
                -- },
                { text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
                { text = { '  ' } },
                { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
                -- {
                --     sign = {
                --         name = { ".*" },
                --         maxwidth = 1,
                --         colwidth = 1,
                --         -- auto = true,
                --         auto = false,
                --     },
                --     click = "v:lua.ScSa",
                -- },
            },
        })
    end,
}
