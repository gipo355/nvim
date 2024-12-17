-- cursor ai in neovim
local vendors = {
    ---@type AvanteProvider
    perplexity = {
        endpoint = 'https://api.perplexity.ai/chat/completions',
        model = 'llama-3.1-sonar-large-128k-online',
        api_key_name = 'cmd:bw get notes perplexity-api-key',
        parse_curl_args = function(opts, code_opts)
            return {
                url = opts.endpoint,
                headers = {
                    ['Accept'] = 'application/json',
                    ['Content-Type'] = 'application/json',
                    ['Authorization'] = 'Bearer '
                        .. os.getenv(opts.api_key_name),
                },
                body = {
                    model = opts.model,
                    messages = { -- you can make your own message, but this is very advanced
                        { role = 'system', content = code_opts.system_prompt },
                        {
                            role = 'user',
                            content = require('avante.providers.openai').get_user_message(
                                code_opts
                            ),
                        },
                    },
                    temperature = 0,
                    max_tokens = 8192,
                    stream = true, -- this will be set by default.
                },
            }
        end,
        -- The below function is used if the vendors has specific SSE spec that is not claude or openai.
        parse_response_data = function(data_stream, event_state, opts)
            require('avante.providers').openai.parse_response(
                data_stream,
                event_state,
                opts
            )
        end,
    },
    ---@type AvanteProvider
    groq = {
        endpoint = 'https://api.groq.com/openai/v1/chat/completions',
        model = 'llama-3.1-70b-versatile',
        api_key_name = 'GROQ_API_KEY',
        parse_curl_args = function(opts, code_opts)
            return {
                url = opts.endpoint,
                headers = {
                    ['Accept'] = 'application/json',
                    ['Content-Type'] = 'application/json',
                    ['Authorization'] = 'Bearer '
                        .. os.getenv(opts.api_key_name),
                },
                body = {
                    model = opts.model,
                    messages = { -- you can make your own message, but this is very advanced
                        { role = 'system', content = code_opts.system_prompt },
                        {
                            role = 'user',
                            content = require('avante.providers.openai').get_user_message(
                                code_opts
                            ),
                        },
                    },
                    temperature = 0,
                    max_tokens = 4096,
                    stream = true, -- this will be set by default.
                },
            }
        end,
        parse_response_data = function(data_stream, event_state, opts)
            require('avante.providers').openai.parse_response(
                data_stream,
                event_state,
                opts
            )
        end,
    },
    ---@type AvanteProvider
    deepseek = {
        endpoint = 'https://api.deepseek.com/chat/completions',
        model = 'deepseek-coder',
        api_key_name = 'DEEPSEEK_API_KEY',
        parse_curl_args = function(opts, code_opts)
            return {
                url = opts.endpoint,
                headers = {
                    ['Accept'] = 'application/json',
                    ['Content-Type'] = 'application/json',
                    ['Authorization'] = 'Bearer '
                        .. os.getenv(opts.api_key_name),
                },
                body = {
                    model = opts.model,
                    messages = { -- you can make your own message, but this is very advanced
                        { role = 'system', content = code_opts.system_prompt },
                        {
                            role = 'user',
                            content = require('avante.providers.openai').get_user_message(
                                code_opts
                            ),
                        },
                    },
                    temperature = 0,
                    max_tokens = 4096,
                    stream = true, -- this will be set by default.
                },
            }
        end,
        parse_response_data = function(data_stream, event_state, opts)
            require('avante.providers').openai.parse_response(
                data_stream,
                event_state,
                opts
            )
        end,
    },
}

return {
    'yetone/avante.nvim',
    event = 'BufReadPre',
    build = 'make',
    enabled = _G.user.ai.avante.enable,
    -- opts = {
    --     -- add any opts here
    --     -- provider = 'openai',
    --     provider = 'copilot',
    -- },
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'stevearc/dressing.nvim',
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        --- The below dependencies are optional,
        'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
        'zbirenbaum/copilot.lua', -- for providers='copilot'

        {
            -- support for image pasting
            'HakonHarnes/img-clip.nvim',
        },

        --- The below is optional, make sure to setup it properly if you have lazy=true
        -- {
        --     'MeanderingProgrammer/render-markdown.nvim',
        --     enabled = _G.user.additional_plugins.render_markdown,
        -- },
    },
    config = function()
        local avante = require('avante')
        avante.setup({
            -- add any opts here
            -- provider = 'openai',
            vendors = vendors,
            ---@type "openai" | "claude" | "azure"  | "copilot" | "perplexity" | "groq" | "deepseek"
            provider = 'copilot',
            auto_suggestions_provider = 'copilot',
            mappings = {
                --- @class AvanteConflictMappings
                diff = {
                    ours = 'co',
                    theirs = 'ct',
                    none = 'c0',
                    both = 'cb',
                    next = ']x',
                    prev = '[x',
                },
                jump = {
                    next = ']]',
                    prev = '[[',
                },
                submit = {
                    normal = '<CR>',
                    insert = '<C-s>',
                },
                toggle = {
                    default = '<leader>mkt',
                    debug = '<leader>mkd',
                    hint = '<leader>mkh',
                    suggestions = '<leader>mks',
                },
                ask = '<leader>ma',
                edit = '<leader>mke',
                refresh = '<leader>mkr',
            },
            behaviour = {
                auto_suggestions = false, -- Experimental stage
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = true,
                support_paste_from_clipboard = true,
            },
            hints = {
                enabled = true,
            },
        })

        -- views can only be fully collapsed with the global statusline
        if _G.user.statusline.disable_statusline then
            vim.opt.laststatus = 0
        end
        -- Default splitting will cause your main splits to jump when opening an edgebar.
        -- To prevent this, set `splitkeep` to either `screen` or `topline`.
        vim.opt.splitkeep = 'screen'
    end,
}
