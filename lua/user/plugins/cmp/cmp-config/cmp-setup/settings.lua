local status_cmp_ok, cmp_types_cmp = pcall(require, 'cmp.types.cmp')
local ConfirmBehavior = cmp_types_cmp.ConfirmBehavior
local luasnip = require('luasnip')

local M = {}

local function prepare_completion_with_delay_opt()
    local opts = {
        completeopt = 'menu,menuone,noinsert',
    }
    if _G.user.cmp.autocomplete_delay.enable then
        opts.autocomplete = false
    end
    return opts
end

M.setup = function(cmp)
    return {
        sources = cmp.config.sources(),

        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        completion = prepare_completion_with_delay_opt(),

        -- show rounded border in completion menu
        window = {
            -- completion = cmp_window.bordered(),
            completion = {
                border = 'single',
                -- winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
                -- winhighlight = cmp_window.bordered().winhighlight,
            },
            documentation = {
                border = 'single',
                -- winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
                -- winhighlight = cmp_window.bordered().winhighlight,
            },
        },
        -- view = {
        --     entries = 'native', -- show native LSP entries
        -- },
        performance = {
            debounce = 150, -- 150ms, interval to group up sources
            throttle = 150, -- 150ms, delay filtering and displaying completions
            max_view_entries = 150,
            max_item_count = 150,
        },
        -- Disable preselect. On enter, the first thing will be used if nothing
        -- is selected.
        preselect = cmp.PreselectMode.None,
        -- conflicts with copilot?
        experimental = {
            ghost_text = _G.user.cmp.ghost_text,
        },
        confirm_opts = {
            behavior = ConfirmBehavior.Replace,
            select = true,
        },

        enabled = function()
            -- local buftype = vim.api.nvim_buf_get_option(0, 'buftype') -- deprecated
            local buftype = vim.bo.buftype
            if buftype == 'prompt' then
                return false
            end
            return true
        end,
    }
end
return M
