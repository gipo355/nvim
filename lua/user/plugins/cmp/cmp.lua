-- TODO: fix autocompletion and suggestions showed
--
-- NOTE: tldr mappings

-- TODO: buffer performance check [https://github.com/mars90226/dotvim/blob/master/lua/vimrc/plugins/nvim_cmp.lua#l71-l78]
-- [https://github.com/NStefan002/nvim_config/blob/main/lua/plugins/lsp.lua#L55]

-- took inspiration from https://github.com/MariaSolOs/dotfiles/blob/ea6bc00cb2b8571143f26f17c5370c738a852c7f/.config/nvim/lua/plugins/nvim-cmp.lua

-- c-l: accept copilot
-- c-y accept suggestion

-- c-o and c-space: open cmp

-- alt-l and alt-h: jumpable snippets

-- c-n and c-j: next
-- c-p and c-k: previous
-- a-n: next copilot
-- a-p: previous copilot

-- c-d and c-f: scroll docs

return {

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {

            { 'luckasRanarison/tailwind-tools.nvim' },
            {
                'lukas-reineke/cmp-rg',
                enabled = _G.user.cmp.rg_intellisense.enable,
            },
            -- Snippet Engine & its associated nvim-cmp source
            {
                'Saecki/crates.nvim',
                event = 'BufRead Cargo.toml',
                config = true,
            },
            { 'onsails/lspkind.nvim' },
            { 'zbirenbaum/copilot.lua' }, -- config in its own file
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments
                    -- Remove the below condition to re-enable on windows
                    if
                        vim.fn.has('win32') == 1
                        or vim.fn.executable('make') == 0
                    then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),

                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
            },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            {
                'hrsh7th/cmp-buffer',
                enabled = _G.user.cmp.buffer_intellisense.enable,
            },

            {
                'Jezda1337/nvim-html-css',
                branch = 'v2',
                enabled = _G.user.htmlcss_intellisense.enable,
            },

            -- If you want to add a bunch of pre-configured snippets,
            --    you can use this plugin to help you. It even has snippets
            --    for various frameworks/libraries/etc. but you will have to
            --    set up the ones that are useful for you.
            -- 'rafamadriz/friendly-snippets',
        },
        config = function()
            -- TODO: fix accept solution
            -- See `:help cmp`
            local cmp = require('cmp')

            -- SETUP: snippets & luasnip

            require('user.plugins.cmp.cmp-config.luasnip').setup_luasnip()

            -- Inside a snippet, use backspace to remove the placeholder.
            vim.keymap.set('s', '<BS>', '<C-O>s', {
                silent = true,
                desc = 'Remove placeholder inside snippet',
            })

            -- SETUP: cmdline

            -- `/` cmp cmdline setup.
            local cmd_line_configs =
                require('user.plugins.cmp.cmp-config.cmd-line')
            cmp.setup.cmdline('/', cmd_line_configs['/']())
            -- `:` cmdline setup.
            cmp.setup.cmdline(':', cmd_line_configs[':']())

            -- SETUP: sources

            local source_config = require('user.plugins.cmp.cmp-config.sources')
            -- set the sources
            vim.api.nvim_create_autocmd('BufReadPre', {
                group = vim.api.nvim_create_augroup(
                    'CmpBufferDisableGrp',
                    { clear = true }
                ),
                callback = function(ev)
                    source_config.set_sources(ev, cmp)
                end,
            })

            -- SETUP: cmp

            cmp.setup(
                require('user.plugins.cmp.cmp-config.cmp-setup').setup(cmp)
            )

            -- SETUP: delay

            -- set delay on autocompletion
            -- requires autocomplete = false
            if _G.user.cmp.autocomplete_delay.enable then
                require('user.plugins.cmp.cmp-config.autocomplete-delay').setup_delay(
                    cmp
                )
            end

            -- BUG: codeium currently bugged in nvim-cmp
            -- must enable codeium plugin and source above
            -- local codeium_ok, codeium = pcall(require, 'codeium')
            -- if codeium_ok then
            --     codeium.setup({
            --         enable_chat = true,
            --     })
            -- end
        end,
    },

    -- {
    --     'Jezda1337/nvim-html-css',
    --     branch = 'v2',
    --     event = 'BufRead *.html',
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --         'nvim-lua/plenary.nvim',
    --     },
    --     enabled = _G.user.htmlcss_intellisense.enable,
    --     config = function()
    --         require('html-css'):setup()
    --     end,
    -- },
}
