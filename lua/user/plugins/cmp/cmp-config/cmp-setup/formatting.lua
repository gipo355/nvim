local _, lspkind = pcall(require, 'lspkind')
local cmp_format_fns = require(
    'user.plugins.cmp.cmp-config.cmp-setup.cmp-formatters.cmp-format-fns'
)
local icons = require('user.utils.icons')
local tailwind_tools = require('tailwind-tools.cmp')

local M = {}

M.setup = function()
    return {
        formatting = {
            expandable_indicator = false,
            deprecated = true,
            fields = { 'kind', 'abbr', 'menu' },
            max_width = 0,
            kind_icons = icons.kind,
            -- TODO: is this needed? check docs for menus in cmp and cmp kind
            -- source_names = {
            --     nvim_lsp = '(LSP)',
            --     emoji = '(Emoji)',
            --     path = '(Path)',
            --     calc = '(Calc)',
            --     cmp_tabnine = '(Tabnine)',
            --     vsnip = '(Snippet)',
            --     luasnip = '(Snippet)',
            --     buffer = '(Buffer)',
            --     tmux = '(TMUX)',
            --     copilot = '(Copilot)',
            --     treesitter = '(TreeSitter)',
            --     codeium = '(Codeium)',
            --     -- cmp_ai = '(Ollama)',
            -- },
            duplicates = {
                buffer = 1,
                path = 1,
                nvim_lsp = 0,
                luasnip = 1,
            },
            duplicates_default = 0,
            format = lspkind.cmp_format({
                ---@type 'text'| 'text_symbol'| 'symbol_text'| 'symbol'
                mode = 'symbol_text', -- show only symbol annotations

                ---@type 'codicons' | 'default'
                preset = 'default',
                show_labelDetails = false,
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                before = function(entry, vim_item)
                    -- add the lsp source name to the menu for html-css plugin
                    if
                        _G.user.htmlcss_intellisense.enable
                        and entry.source.name == 'html-css'
                    then
                        vim_item.menu = entry.completion_item.menu
                        -- return vim_item
                    end

                    -- adds the lsp source name to the menu
                    -- NOTE: this overrides the right side of the menu, displays the source instead of function details (params, return, etc)
                    if entry.source.name == 'nvim_lsp' then
                        -- prevent error if client is not available
                        local lspserver_name = nil
                        pcall(function()
                            lspserver_name = entry.source.source.client.name

                            -- if name is 'tailwindcss', format it
                            if
                                _G.user.tailwindcss.enable_lsp
                                and lspserver_name == 'tailwindcss'
                            then
                                vim_item = tailwind_tools.lspkind_format(
                                    entry,
                                    vim_item
                                )
                            end

                            -- if name is jdtls, return since it provides info on list item
                            if lspserver_name == 'jdtls' then
                                return
                            end
                            if lspserver_name == 'rust_analyzer' then
                                return cmp_format_fns.rust_fmt(entry, vim_item)
                            end
                            -- NOTE: this amazing code shows params
                            if lspserver_name == 'gopls' then
                                return cmp_format_fns.go_fmt(entry, vim_item)
                            end
                            if lspserver_name == 'lua_ls' then
                                return cmp_format_fns.lua_fmt(entry, vim_item)
                            end

                            -- split the string by underscore or camelcase or pascalcase or kebabcase or snakecase and get the first word of each
                            -- if string is longer than 5 chars, shorten it
                            if string.len(lspserver_name) > 5 then
                                local t = {}
                                -- split by underscore, kebabcase or snakecase
                                for str in
                                    string.gmatch(lspserver_name, '([^_%-]+)')
                                do
                                    table.insert(t, str)
                                end
                                -- split by camelcase or pascalcase
                                for i, str in ipairs(t) do
                                    local camelCaseSplit = {}
                                    for camel in
                                        string.gmatch(str, '([%a][%l]*)')
                                    do
                                        table.insert(camelCaseSplit, camel)
                                    end
                                    t[i] = camelCaseSplit[1]:sub(1, 1)
                                end
                                vim_item.menu = '['
                                    .. 'LSP: '
                                    .. table.concat(t, '')
                                    .. ']'
                            else
                                vim_item.menu = '['
                                    .. 'LSP: '
                                    .. lspserver_name
                                    .. ']'
                            end
                        end)
                    else
                        -- if its not lsp, provide a custom menu
                        -- this allows us to prevent overriding jdtls default infos on menu(params, source)
                        vim_item.menu = ({
                            buffer = '[Buffer]',
                            typescript_tools = '[TS]',
                            -- nvim_lsp = '[LSP]',
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
                    end

                    -- NOT this, old own method
                    -- vim_item =
                    --     cmputils.formatForTailwindCSS(entry, vim_item)

                    -- NOT: old way for tailwind
                    -- vim_item =
                    --     require('tailwindcss-colorizer-cmp').formatter(
                    --         entry,
                    --         vim_item
                    --     )

                    -- if _G.user.tailwindcss.enable_lsp then
                    --     vim_item =
                    --         tailwind_tools.lspkind_format(entry, vim_item)
                    -- end

                    return vim_item
                end,
            }),
        },
    }
end

return M
