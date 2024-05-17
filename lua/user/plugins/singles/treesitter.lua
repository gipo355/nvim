return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        priority = 100,
        dependencies = {
            {
                'HiPhish/rainbow-delimiters.nvim',
                url = 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git',
                event = 'BufReadPre',
                enabled = _G.user.enable_rainbow_parens,
            },
        },
        build = ':TSUpdate',
        config = function()
            -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

            ---@diagnostic disable-next-line: missing-fields
            require('nvim-treesitter.configs').setup({
                autotag = { enable = true },
                ensure_installed = {
                    'bash',
                    'c',
                    'html',
                    'lua',
                    'markdown',
                    'vim',
                    'vimdoc',
                    'sql',
                    'gomod',
                    'gosum',
                    'gowork',
                    'gitignore',
                    'gitcommit',
                    'gitattributes',
                    'git_rebase',
                    'git_config',
                    'dockerfile',
                    'dot',
                    'diff',
                    'comment',
                    'query',
                    'http',
                    'json5',
                    'http',
                    'graphql',
                    'regex',
                    'toml',
                    'luadoc',
                    'passwd',
                    'pug',
                    'terraform',
                    'vimdoc',
                    'xml',
                    'vim',
                    'astro',
                    'markdown_inline',
                    'kotlin',
                    'bash',
                    'c',
                    'javascript',
                    'json',
                    'jsonc',
                    'go',
                    'python',
                    'svelte',
                    'typescript',
                    'tsx',
                    'css',
                    'scss',
                    'rust',
                    'java',
                    'yaml',
                    'scala',
                    'pug',
                    'prisma',
                    'templ',
                },
                -- Autoinstall languages that are not installed
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },

                -- for plugin vim-matchcup
                matchup = {
                    enable = true, -- mandatory, false will disable the whole extension
                    -- disable = { 'c', 'ruby' }, -- optional, list of language that will be disabled
                    -- [options]
                },
            })

            -- There are additional nvim-treesitter modules that you can use to interact
            -- with nvim-treesitter. You should go explore a few and see what interests you:
            --
            --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
            --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
            --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
        end,
    },
}
