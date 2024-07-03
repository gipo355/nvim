local _, lspkind = pcall(require, 'lspkind')
local icons = require('user.utils.icons')
local tailwind_tools = require('tailwind-tools.cmp')

local M = {}

M.setup = function()
    return {
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text', -- show only symbol annotations
                -- mode = 'symbol', -- show only symbol annotations
                menu = {
                    buffer = '[Buffer]',
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
                },
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                show_labelDetails = false,

                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

                -- format for tailwind lspkind, things that can change tailwind formatting: tailwind-tools, tailwindcss-colorizer-cmp, highlight-colors
                -- from reddit to include tailwind
                -- enable THIS before to use other formatters
                -- before = require('tailwind-tools.cmp').lspkind_format,

                before = function(entry, vim_item)
                    if
                        _G.user.enable_css_intellisense_in_html
                        and entry.source.name == 'html-css'
                    then
                        vim_item.menu = entry.completion_item.menu
                        -- return vim_item
                    end

                    -- NOT this, old own method
                    -- vim_item =
                    --     cmputils.formatForTailwindCSS(entry, vim_item)

                    -- vim_item =
                    --     require('tailwindcss-colorizer-cmp').formatter(
                    --         entry,
                    --         vim_item
                    --     )

                    -- if _G.user.enable_tailwindcss then
                    vim_item = tailwind_tools.lspkind_format(entry, vim_item)
                    -- end

                    return vim_item
                end,
            }),
            fields = { 'kind', 'abbr', 'menu' },
            max_width = 0,
            kind_icons = icons.kind,
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
