local _, lspkind = pcall(require, 'lspkind')
local icons = require('user.utils.icons')
local tailwind_tools = require('tailwind-tools.cmp')

local M = {}

M.setup = function()
    return {
        formatting = {
            -- example custom format, wanted to add lsp source name
            -- format = function(entry, vim_item)
            --     local cmp_item = entry:get_completion_item() --- @type lsp.CompletionItem
            --
            --     for index, data in ipairs(entry) do
            --         print(index)
            --
            --         for key, value in pairs(data) do
            --             print('\t', key, value)
            --         end
            --     end
            --
            --     -- if entry.source.name == 'nvim_lsp' then
            --     --     -- Display which LSP servers this item came from.
            --     --     local lspserver_name = nil
            --     --     pcall(function()
            --     --         lspserver_name = entry.source.source.client.name
            --     --         vim_item.menu = lspserver_name
            --     --     end)
            --     -- end
            -- end,
            format = lspkind.cmp_format({
                mode = 'symbol_text', -- show only symbol annotations
                -- mode = 'symbol', -- show only symbol annotations

                -- if i display the menu, it won't display dynamic icons like typescript_tools
                -- menu = {
                --     buffer = '[Buffer]',
                --     typescript_tools = '[TS]',
                --     nvim_lsp = '[LSP]',
                --     copilot = '[Copilot]',
                --     git = '[Git]',
                --     luasnip = '[LuaSnip]',
                --     path = '[Path]',
                --     cmp_tabnine = '[TabNine]',
                --     calc = '[Calc]',
                --     emoji = '[Emoji]',
                --     treesitter = '[Treesitter]',
                --     crates = '[Crates]',
                --     tmux = '[Tmux]',
                --     Codeium = '',
                --     rg = '[Rg]',
                --     nvim_lua = '[Lua]',
                --     latex_symbols = '[Latex]',
                -- },

                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                show_labelDetails = false,

                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

                -- format for tailwind lspkind, things that can change tailwind formatting: tailwind-tools, tailwindcss-colorizer-cmp, highlight-colors
                -- from reddit to include tailwind
                -- enable THIS before to use other formatters
                -- before = require('tailwind-tools.cmp').lspkind_format,

                -- https://github.com/onsails/lspkind.nvim/issues/19
                -- https://www.reddit.com/r/neovim/comments/12qo8na/display_specific_lsp_in_cmp_completions/
                before = function(entry, vim_item)
                    vim_item.menu = ({
                        buffer = '[Buffer]',
                        typescript_tools = '[TS]',
                        nvim_lsp = '[LSP]',
                        copilot = '[Copilot]',
                        git = '[Git]',
                        luasnip = '[LuaSnip]',
                        path = '[Path]',
                        cmp_tabnine = '[TabNine]',
                        calc = '[Calc]',
                        emoji = '[Emoji]',
                        treesitter = '[Treesitter]',
                        crates = '[Crates]',
                        tmux = '[Tmux]',
                        Codeium = '',
                        rg = '[Rg]',
                        nvim_lua = '[Lua]',
                        latex_symbols = '[Latex]',
                    })[entry.source.name]

                    if
                        _G.user.enable_css_intellisense_in_html
                        and entry.source.name == 'html-css'
                    then
                        vim_item.menu = entry.completion_item.menu
                        -- return vim_item
                    end

                    -- adds the lsp source name to the menu
                    -- print(entry.source.name) -- nvim_lsp
                    if entry.source.name == 'nvim_lsp' then
                        -- print('entry.source.name', entry.source.name)
                        -- -- Try to get the LSP client's name
                        -- local ok, result = pcall(function()
                        --     return entry.completion_item.source.client.name
                        -- end)
                        -- --
                        -- -- print('result', result)
                        -- --
                        -- -- -- If the pcall was successful, set the menu item to the LSP client's name
                        -- if ok then
                        --     vim_item.menu = result
                        -- end
                        --
                        -- Display which LSP servers this item came from.
                        -- local lspserver_name = nil
                        -- print('entry.source.source.client.name')
                        -- print(entry.source.source.client.name)

                        -- vim_item.menu = entry.source.source.client.name
                        local lspserver_name = nil
                        pcall(function()
                            lspserver_name = entry.source.source.client.name
                            -- print('client name ' + lspserver_name) -- typescript_tools
                            -- print('client name ' + lspserver_name) -- typescript_tools
                            vim_item.menu = lspserver_name
                        end)
                    end

                    -- NOT this, old own method
                    -- vim_item =
                    --     cmputils.formatForTailwindCSS(entry, vim_item)

                    -- vim_item =
                    --     require('tailwindcss-colorizer-cmp').formatter(
                    --         entry,
                    --         vim_item
                    --     )

                    if _G.user.enable_tailwindcss then
                        vim_item =
                            tailwind_tools.lspkind_format(entry, vim_item)
                    end

                    return vim_item
                end,
            }),
            fields = { 'kind', 'abbr', 'menu' },
            max_width = 0,
            kind_icons = icons.kind,
            -- TODO: fix this with menu above - do they conflict?
            source_names = {
                nvim_lsp = '(LSP)',
                emoji = '(Emoji)',
                path = '(Path)',
                calc = '(Calc)',
                cmp_tabnine = '(Tabnine)',
                vsnip = '(Snippet)',
                luasnip = '(Snippet)',
                buffer = '(Buffer)',
                tmux = '(TMUX)',
                copilot = '(Copilot)',
                treesitter = '(TreeSitter)',
                codeium = '(Codeium)',
                -- cmp_ai = '(Ollama)',
            },
            duplicates = {
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
                luasnip = 1,
            },
            duplicates_default = 0,
        },
    }
end

return M
