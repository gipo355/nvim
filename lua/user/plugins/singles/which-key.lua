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
            local wk = require('which-key')
            wk.setup({
                ---@type false | "classic" | "modern" | "helix"
                preset = 'modern',
                ---@type wk.Win
                win = {
                    -- width = 1,
                    -- height = { min = 4, max = 50 },
                    -- col = 0,
                    -- row = -1,
                    -- border = "none",
                    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
                    title = true,
                    title_pos = 'center',
                    zindex = 1000,
                    -- Additional vim.wo and vim.bo options
                    -- bo = {},
                    -- wo = {
                    --     -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
                    -- },
                },
                layout = {
                    -- width = { min = 20 }, -- min and max width of the columns
                    -- spacing = 3, -- spacing between columns
                    align = 'center', -- align columns left, center or right
                },

                -- OLD?
                -- popup_mappings = {
                --     scroll_down = '<c-d>', -- binding to scroll down inside the popup
                --     scroll_up = '<c-u>', -- binding to scroll up inside the popup
                -- },
                -- ignore_missing = false,
                -- opts = {
                --     mode = 'n', -- NORMAL mode
                --     prefix = '<leader>',
                --     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                --     silent = true, -- use `silent` when creating keymaps
                --     noremap = true, -- use `noremap` when creating keymaps
                --     nowait = true, -- use `nowait` when creating keymaps
                -- },
                -- vopts = {
                --     mode = 'v', -- VISUAL mode
                --     prefix = '<leader>',
                --     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                --     silent = true, -- use `silent` when creating keymaps
                --     noremap = true, -- use `noremap` when creating keymaps
                --     nowait = true, -- use `nowait` when creating keymaps
                -- },
            })

            -- Document existing key chains
            -- this way we can delegate assigning to other files
            -- especially usefull when we have a lot of keybinds and many depend on other plugins
            -- when we disable the plugin, the keys will unregister

            require('which-key').add({
                {
                    -- ### NORMAL MODE
                    mode = 'n',
                    buffer = nil,
                    silent = true,
                    noremap = true,

                    { '<leader>o', group = 'multi-cursor', remap = false },
                    { '<leader>o_', hidden = true, remap = false },
                    { '<leader><tab>', group = '[tab]s', remap = false },
                    { '<leader><tab>_', hidden = true, remap = false },
                    {
                        '<leader>A',
                        group = 'repl[a]ce and Refactor',
                        remap = false,
                    },
                    { '<leader>A_', hidden = true, remap = false },
                    {
                        '<leader>B',
                        group = '[B]ookmarks, Todos',
                        remap = false,
                    },
                    { '<leader>B_', hidden = true, remap = false },
                    { '<leader>C', group = '[C]ompiler', remap = false },
                    { '<leader>C_', hidden = true, remap = false },
                    { '<leader>D', group = '[D]atabase', remap = false },
                    { '<leader>D_', hidden = true, remap = false },
                    { '<leader>M', group = 'Co[m]piler', remap = false },
                    { '<leader>M_', hidden = true, remap = false },
                    { '<leader>N', group = '[n]x', remap = false },
                    { '<leader>N_', hidden = true, remap = false },
                    { '<leader>O', group = 'git [O]cto', remap = false },
                    { '<leader>O_', hidden = true, remap = false },
                    { '<leader>S', group = '[S]ession', remap = false },
                    { '<leader>S_', hidden = true, remap = false },
                    {
                        '<leader>b',
                        group = '[b]uffers and file tree',
                        remap = false,
                    },
                    { '<leader>b_', hidden = true, remap = false },

                    { '<leader>mk', group = '[a]vante', remap = false },
                    { '<leader>mk_', hidden = true, remap = false },

                    { '<leader>d', group = '[d]ebug', remap = false },
                    { '<leader>d_', hidden = true, remap = false },

                    { '<leader>x', group = 'Trouble', remap = false },
                    { '<leader>x_', hidden = true, remap = false },

                    { '<leader>D', group = '[d]ocker', remap = false },
                    { '<leader>D_', hidden = true, remap = false },
                    { '<leader>g', group = '[g]it', remap = false },
                    { '<leader>gG', group = '[g]it [g]ist', remap = false },
                    { '<leader>gG_', hidden = true, remap = false },
                    { '<leader>gL', group = '[g]it [L]inker', remap = false },
                    { '<leader>gL_', hidden = true, remap = false },
                    { '<leader>g_', hidden = true, remap = false },
                    -- { '<leader>gc', group = '[g]it [C]ommits', remap = false },
                    -- { '<leader>gc_', hidden = true, remap = false },
                    { '<leader>gd', group = '[g]it [D]iffview', remap = false },
                    { '<leader>gd_', hidden = true, remap = false },
                    { '<leader>gs', group = '[G]it [S]earch', remap = false },
                    { '<leader>gs_', hidden = true, remap = false },
                    { '<leader>h', group = '[h] docs', remap = false },
                    { '<leader>h_', hidden = true, remap = false },
                    { '<leader>l', group = '[l]sp', remap = false },
                    { '<leader>l_', hidden = true, remap = false },
                    { '<leader>m', group = 'Ai', remap = false },
                    { '<leader>m_', hidden = true, remap = false },
                    {
                        '<leader>mc',
                        group = 'Ai [C]opilot Chat',
                        remap = false,
                    },
                    { '<leader>mc_', hidden = true, remap = false },
                    { '<leader>ml', group = 'Ai [l]lama', remap = false },
                    { '<leader>ml_', hidden = true, remap = false },
                    { '<leader>mv', group = 'Ai OpenAI', remap = false },
                    { '<leader>mv_', hidden = true, remap = false },
                    { '<leader>r', group = '[r] http', remap = false },
                    { '<leader>r_', hidden = true, remap = false },
                    { '<leader>s', group = '[s]earch', remap = false },
                    { '<leader>s_', hidden = true, remap = false },
                    {
                        '<leader>mf',
                        group = 'Ai [C]ode Companion',
                        remap = false,
                    },
                    { '<leader>mf_', hidden = true, remap = false },

                    -- { '<leader>t', group = '[t]ests', remap = false },
                    -- { '<leader>t_', hidden = true, remap = false },

                    { '<leader>t', group = '[t]ypescript', remap = false },
                    { '<leader>t_', hidden = true, remap = false },

                    { '<leader>v', group = '[v] lsp', remap = false },
                    { '<leader>v_', hidden = true, remap = false },
                    -- { 'cv', group = 'flash and surround', remap = false },
                    -- { 's_', hidden = true, remap = false },
                },
                -- ### VISUAL MODE
                {
                    mode = { 'v' },
                    buffer = nil,
                    silent = true,
                    noremap = true,
                    { '<leader>o', group = 'multi-cursor', remap = false },
                    { '<leader>o_', hidden = true, remap = false },
                    { '<leader>g', group = '[g]it', remap = false },
                    { '<leader>gL', group = '[g]it [L]inker', remap = false },
                    { '<leader>gL_', hidden = true, remap = false },
                    { '<leader>g_', hidden = true, remap = false },
                    { '<leader>gc', group = '[g]it [C]ommits', remap = false },
                    { '<leader>gc_', hidden = true, remap = false },
                    { '<leader>gs', group = '[G]it [S]earch', remap = false },
                    { '<leader>gs_', hidden = true, remap = false },
                    { '<leader>h', group = '[h] docs', remap = false },
                    { '<leader>h_', hidden = true, remap = false },
                    { '<leader>l', group = '[l]sp', remap = false },
                    { '<leader>l_', hidden = true, remap = false },
                    { '<leader>m', group = 'Ai', remap = false },
                    { '<leader>m_', hidden = true, remap = false },
                    {
                        '<leader>mc',
                        group = 'Ai [C]opilot Chat',
                        remap = false,
                    },
                    { '<leader>mc_', hidden = true, remap = false },
                    { '<leader>ml', group = 'Ai [l]lama', remap = false },
                    { '<leader>ml_', hidden = true, remap = false },
                    { '<leader>mv', group = 'Ai OpenAI', remap = false },
                    { '<leader>mv_', hidden = true, remap = false },
                    { '<leader>v', group = '[v] lsp', remap = false },
                    { '<leader>v_', hidden = true, remap = false },
                },
            })
        end,
    },
}
