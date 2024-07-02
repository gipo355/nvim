-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup({
                popup_mappings = {
                    scroll_down = '<c-d>', -- binding to scroll down inside the popup
                    scroll_up = '<c-u>', -- binding to scroll up inside the popup
                },
                ignore_missing = false,
                opts = {
                    mode = 'n', -- NORMAL mode
                    prefix = '<leader>',
                    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                    silent = true, -- use `silent` when creating keymaps
                    noremap = true, -- use `noremap` when creating keymaps
                    nowait = true, -- use `nowait` when creating keymaps
                },
                vopts = {
                    mode = 'v', -- VISUAL mode
                    prefix = '<leader>',
                    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                    silent = true, -- use `silent` when creating keymaps
                    noremap = true, -- use `noremap` when creating keymaps
                    nowait = true, -- use `nowait` when creating keymaps
                },
            })

            -- Document existing key chains
            -- this way we can delegate assigning to other files
            -- especially usefull when we have a lot of keybinds and many depend on other plugins
            -- when we disable the plugin, the keys will unregister

            -- ### NORMAL MODE
            require('which-key').register({
                -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
                -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },

                ['s'] = {
                    name = 'flash and surround',
                    _ = 'which_key_ignore',
                },

                ['<leader>A'] = {
                    name = 'repl[a]ce and Refactor',
                    _ = 'which_key_ignore',
                },

                ['<leader>M'] = {
                    name = 'Co[m]piler',
                    _ = 'which_key_ignore',
                },

                ['<leader>r'] = {
                    name = '[r] http',
                    _ = 'which_key_ignore',
                },

                ['<leader>s'] = { name = '[s]earch', _ = 'which_key_ignore' },
                ['<leader>S'] = { name = '[S]ession', _ = 'which_key_ignore' },

                ['<leader>m'] = { name = 'Ai', _ = 'which_key_ignore' },
                ['<leader>mc'] = {
                    name = 'Ai [C]opilot Chat',
                    _ = 'which_key_ignore',
                },
                ['<leader>mv'] = {
                    name = 'Ai OpenAI',
                    _ = 'which_key_ignore',
                },

                ['<leader>ml'] = {
                    name = 'Ai [l]lama',
                    _ = 'which_key_ignore',
                },

                ['<leader>g'] = { name = '[g]it', _ = 'which_key_ignore' },
                ['<leader>gG'] = {
                    name = '[g]it [g]ist',
                    _ = 'which_key_ignore',
                },

                ['<leader>O'] = {
                    name = 'git [O]cto',
                    _ = 'which_key_ignore',
                },

                -- ['<leader>G'] = { name = '[G]ithub', _ = 'which_key_ignore' },
                ['<leader>gd'] = {
                    name = '[g]it [D]iffview',
                    _ = 'which_key_ignore',
                },
                ['<leader>gL'] = {
                    name = '[g]it [L]inker',
                    _ = 'which_key_ignore',
                },
                ['<leader>gc'] = {
                    name = '[g]it [C]ommits',
                    _ = 'which_key_ignore',
                },
                ['<leader>gs'] = {
                    name = '[G]it [S]earch',
                    _ = 'which_key_ignore',
                },

                ['<leader>b'] = {
                    name = '[b]uffers and file tree',
                    _ = 'which_key_ignore',
                },
                ['<leader>B'] = {
                    name = '[B]ookmarks, Todos',
                    _ = 'which_key_ignore',
                },

                ['<leader><tab>'] = { name = '[tab]s', _ = 'which_key_ignore' },

                ['<leader>l'] = { name = '[l]sp', _ = 'which_key_ignore' },

                ['<leader>v'] = { name = '[v] lsp', _ = 'which_key_ignore' },

                ['<leader>h'] = { name = '[h] docs', _ = 'which_key_ignore' },

                ['<leader>D'] = { name = '[D]atabase', _ = 'which_key_ignore' },
                ['<leader>d'] = { name = '[d]ebug', _ = 'which_key_ignore' },

                -- TODO: lvim which key config

                ['<leader>C'] = {
                    name = '[C]ompiler',
                    _ = 'which_key_ignore',
                },

                ['<leader>t'] = {
                    name = '[t]ests',
                    _ = 'which_key_ignore',
                },
            }, {
                mode = 'n',
                buffer = nil,
                silent = true,
                noremap = true,
                -- nowait = true,
                -- expr = true,
            })

            -- ### VISUAL MODE
            require('which-key').register({
                ['<leader>l'] = { name = '[l]sp', _ = 'which_key_ignore' },

                ['<leader>m'] = { name = 'Ai', _ = 'which_key_ignore' },

                ['<leader>mc'] = {
                    name = 'Ai [C]opilot Chat',
                    _ = 'which_key_ignore',
                },
                ['<leader>ml'] = {
                    name = 'Ai [l]lama',
                    _ = 'which_key_ignore',
                },
                ['<leader>mv'] = {
                    name = 'Ai OpenAI',
                    _ = 'which_key_ignore',
                },

                ['<leader>v'] = { name = '[v] lsp', _ = 'which_key_ignore' },

                ['<leader>h'] = { name = '[h] docs', _ = 'which_key_ignore' },

                ['<leader>g'] = { name = '[g]it', _ = 'which_key_ignore' },
                ['<leader>gc'] = {
                    name = '[g]it [C]ommits',
                    _ = 'which_key_ignore',
                },
                ['<leader>gs'] = {
                    name = '[G]it [S]earch',
                    _ = 'which_key_ignore',
                },
                ['<leader>gL'] = {
                    name = '[g]it [L]inker',
                    _ = 'which_key_ignore',
                },
            }, {
                mode = 'v',
                buffer = nil,
                silent = true,
                noremap = true,
                -- nowait = true,
                -- expr = true,
            })
        end,
    },
}
