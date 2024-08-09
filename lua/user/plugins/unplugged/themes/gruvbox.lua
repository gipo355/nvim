return {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        _G.user.themes.gruvbox = 'gruvbox'
        local ok, gruvbox = pcall(require, 'gruvbox')

        if not ok then
            return
        end

        gruvbox.setup({
            terminal_colors = true,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            invert_selection = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            dim_inactive = false,
            transparent_mode = _G.user.transparent_background,

            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                comments = true,
                operators = true,
                folds = true,
            },
            strikethrough = true,
            contrast = '', -- can be "hard", "soft" or empty string
            -- palette_overrides = {},
            overrides = {
                --     -- GruvboxBg0 = { bg = '#1d1d1d' },
                --     -- GruvboxBg1 = { fg = colors.bg1 },
                --     -- GruvboxBg2 = { fg = colors.bg2 },
                --     -- GruvboxBg3 = { fg = colors.bg3 },
                --     -- GruvboxBg4 = { fg = colors.bg4 },
                --     -- Function = { link = "GruvboxGreenBold" },
                --     Operator = { fg = '#fb4934', italic = false },
                --     Keyword = { fg = '#fb4934', italic = false },
                --     -- Keyword = { fg = "#b91c1c", italic = true },
                --     -- Repeat = { link = "GruvboxRed" },
                --     -- Statement = { fg = "#991b1b" },
                --     -- Conditional = { link = "GruvboxRed" },
                -- Comment = { fg = '#666662' },
                -- Comment = { bg = '#928374' },
                Comment = {
                    fg = '#665c54',
                    -- bg = '#282828',
                    -- bg = '#282811',
                    -- bg = '#343434',
                    -- bg = '#2b2b2b',
                    bg = '#2d2d2d',
                    italic = true,
                },
                LspInlayHint = { fg = '#665c54', bg = '#202020', italic = true },
                -- CursorColumn = {
                --     -- fg = '#242424',
                --     bg = '#242424',
                -- },
                -- ColorColumn = {
                --     -- fg = '#242424',
                --     bg = '#242424',
                -- },
                --     -- Constant = { fg = "blue" },
                --     -- String = { fg = "#4d7c0f", italic = false },
                --     Normal = { fg = '#d6d3d1' },
                --     Function = { fg = '#9fbb26', bold = true },
                --     -- Special = { fg = 'white' }
                --     -- StorageClass = { fg = 'white' },
                --     -- typescriptIdentifier = { fg = 'white' }
                --     -- Boolean = { link = "GruvboxPurple" },
                --     Number = { fg = "#948ae3" },
                --     Float = { fg = "#948ae3" },
                --     -- Type = { link = "GruvboxYellow" },
                --     -- Typedef = { link = "GruvboxYellow" },

                --     -- nvim-treesitter
                --     -- TSStrong = { bold = config.bold },
                --     -- TSStrike = { strikethrough = config.strikethrough },
                --     -- TSEmphasis = { italic = config.italic },
                --     -- TSUnderline = { underline = config.underline },
                --     -- TSKeywordOperator = { link = "GruvboxRed" },

                --     -- javascript
                --     -- javaScriptBraces = { link = "GruvboxFg1" },
                --     -- javaScriptFunction = { link = "GruvboxAqua" },
                --     -- javaScriptIdentifier = { link = "GruvboxRed" },
                --     -- javaScriptMember = { link = "GruvboxBlue" },
                --     -- javaScriptNumber = { link = "GruvboxPurple" },
                --     -- javaScriptNull = { link = "GruvboxPurple" },
                --     -- javaScriptParens = { link = "GruvboxFg3" },

                --     -- typescript
                --     -- typescriptReserved = { link = "GruvboxAqua" },
                --     -- typescriptLabel = { link = "GruvboxAqua" },
                --     -- typescriptFuncKeyword = { link = "GruvboxAqua" },
                --     -- typescriptIdentifier = { link = "GruvboxOrange" },
                --     -- typescriptBraces = { link = "GruvboxFg1" },
                --     -- typescriptEndColons = { link = "GruvboxFg1" },
                --     -- typescriptDOMObjects = { link = "GruvboxFg1" },
                --     -- typescriptAjaxMethods = { link = "GruvboxFg1" },
                --     -- typescriptLogicSymbols = { link = "GruvboxFg1" },
                --     -- typescriptDocSeeTag = { link = "Comment" },
                --     -- typescriptDocParam = { link = "Comment" },
                --     -- typescriptDocTags = { link = "vimCommentTitle" },
                --     -- typescriptGlobalObjects = { link = "GruvboxFg1" },
                --     -- typescriptParens = { link = "GruvboxFg3" },
                --     -- typescriptOpSymbols = { link = "GruvboxFg3" },
                --     -- typescriptHtmlElemProperties = { link = "GruvboxFg1" },
                --     -- typescriptNull = { link = "GruvboxPurple" },
                --     -- typescriptInterpolationDelimiter = { link = "GruvboxAqua" },
            },
        })
    end,
}
