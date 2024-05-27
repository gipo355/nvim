local set_desc = require('user.utils.functions').set_keymap_desc
return {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    -- version = '*',
    config = function()
        require('toggleterm').setup({

            active = true,
            on_config_done = nil,
            -- size can be a number or function which is passed the current terminal
            -- size = 20,
            size = function(term)
                if term.direction == 'horizontal' then
                    return 15
                elseif term.direction == 'vertical' then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            hidden = true,
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
            start_in_insert = true,
            insert_mappings = true, -- whether or not the open mapping applies in insert mode

            persist_size = false,
            close_on_exit = true, -- close the terminal window when the process exits
            auto_scroll = true, -- automatically scroll to the bottom on terminal output
            persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered

            -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
            direction = 'float',
            shell = nil, -- change the default shell
            -- This field is only relevant if direction is set to 'float'
            float_opts = {
                -- The border key is *almost* the same as 'nvim_win_open'
                -- see :h nvim_win_open for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                border = 'curved',
                -- width = <value>,
                -- height = <value>,
                winblend = 0,
                highlights = {
                    border = 'Normal',
                    background = 'Normal',
                },
            },
            -- Add executables on the config.lua
            -- { cmd, keymap, description, direction, size }
            -- lvim.builtin.terminal.execs = {...} to overwrite
            -- lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
            -- TODO: pls add mappings in which key and refactor this
        })

        vim.keymap.set(
            'n',
            '<leader>E',
            '<cmd>ToggleTermSendCurrentLine<cr>',
            set_desc('[E]xec sh line')
        )
        vim.keymap.set(
            'v',
            '<leader>E',
            '<cmd>ToggleTermSendVisualLines<cr>',
            set_desc('[E]xec sh line')
        )

        local toggleterm_utils =
            require('user.plugins.toggleterm.utils.toggleterm_utils')

        -- init utils, will add keymaps for each exec
        -- BUG: will make termials lag
        -- toggleterm_utils.init()

        local Terminal = require('toggleterm.terminal').Terminal

        -- ## lazydocker client keymap
        local docker_tui = 'lazydocker'
        local docker_client = Terminal:new({
            cmd = docker_tui,
            -- dir = 'git_dir',
            hidden = true,
            -- direction = "tab",
            direction = 'float',
            float_opts = {
                -- border = "double",
                border = 'none',
                width = 10000,
                height = 10000,
            },
        })
        local function docker_client_toggle()
            docker_client:toggle()
        end
        -- TODO: overriding something!!
        vim.keymap.set(
            'n',
            '<A-d>',
            docker_client_toggle,
            set_desc('docker client')
        )

        -- ## OLLAMA client keymap
        vim.keymap.set('n', '<leader>mo', function()
            local ollama_client = Terminal:new({
                cmd = 'ollama run codellama',
                hidden = true,
                -- dir = 'git_dir',
                direction = 'vertical',
                on_open = function(term)
                    vim.cmd('startinsert!')
                    vim.api.nvim_buf_set_keymap(
                        term.bufnr,
                        'n',
                        'q',
                        '<cmd>close<CR>',
                        { noremap = true, silent = true }
                    )
                end,
                on_close = function(_)
                    vim.cmd('startinsert!')
                end,
                count = 99,
            })
            ollama_client:toggle()
        end, set_desc('Ollama'))

        -- ## lazygit keymap client
        vim.keymap.set('n', '<c-g>', function()
            local lazygit_toggle = function()
                local lazygit = Terminal:new({
                    cmd = 'lazygit',
                    hidden = true,
                    -- dir = 'git_dir',
                    direction = 'float',
                    float_opts = {
                        border = 'none',
                        width = 100000,
                        height = 100000,
                    },
                    on_open = function(term)
                        vim.cmd('startinsert!')
                        vim.api.nvim_buf_set_keymap(
                            term.bufnr,
                            'n',
                            'q',
                            '<cmd>close<CR>',
                            { noremap = true, silent = true }
                        )
                    end,
                    on_close = function(_)
                        vim.cmd('startinsert!')
                    end,
                    count = 99,
                })
                lazygit:toggle()
            end
            lazygit_toggle()
        end, { desc = 'LazyGit' })

        -- ## k9s
        vim.keymap.set('n', '<leader>T', function()
            local k9s_toggle = function()
                local k9s = Terminal:new({
                    cmd = 'k9s',
                    hidden = true,
                    -- dir = 'git_dir',
                    direction = 'float',
                    float_opts = {
                        border = 'none',
                        width = 100000,
                        height = 100000,
                    },
                    on_open = function(term)
                        vim.cmd('startinsert!')
                        vim.api.nvim_buf_set_keymap(
                            term.bufnr,
                            'n',
                            'q',
                            '<cmd>close<CR>',
                            { noremap = true, silent = true }
                        )
                    end,
                    on_close = function(_)
                        vim.cmd('startinsert!')
                    end,
                    count = 99,
                })
                k9s:toggle()
            end
            k9s_toggle()
        end, { desc = 'k9s' })
    end,
}
