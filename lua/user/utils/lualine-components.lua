local window_width_limit = 100

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.o.columns > window_width_limit
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local colors = require('user.utils.colors')

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local icons = require('user.utils.icons')

return {
    mode = {
        function()
            return ' ' .. icons.ui.Target .. ' '
        end,
        padding = { left = 0, right = 0 },
        color = {},
        cond = nil,
    },
    branch = {
        'b:gitsigns_head',
        icon = icons.git.Branch,
        color = { gui = 'bold' },
    },
    filename = {
        'filename',
        color = {},
        cond = nil,
    },
    diff = {
        'diff',
        source = diff_source,
        symbols = {
            added = icons.git.LineAdded .. ' ',
            modified = icons.git.LineModified .. ' ',
            removed = icons.git.LineRemoved .. ' ',
        },
        padding = { left = 2, right = 1 },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
        },
        cond = nil,
    },
    python_env = {
        function()
            local utils = require('user.utils.functions')
            if vim.bo.filetype == 'python' then
                local venv = os.getenv('CONDA_DEFAULT_ENV')
                    or os.getenv('VIRTUAL_ENV')
                if venv then
                    local web_devicons = require('nvim-web-devicons')
                    local py_icon, _ = web_devicons.get_icon('.py')
                    return string.format(
                        ' ' .. py_icon .. ' (%s)',
                        utils.env_cleanup(venv)
                    )
                end
            end
            return ''
        end,
        color = { fg = colors.green },
        cond = conditions.hide_in_width,
    },
    diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
            error = icons.diagnostics.BoldError .. ' ',
            warn = icons.diagnostics.BoldWarning .. ' ',
            info = icons.diagnostics.BoldInformation .. ' ',
            hint = icons.diagnostics.BoldHint .. ' ',
        },
        -- cond = conditions.hide_in_width,
    },
    treesitter = {
        function()
            return icons.ui.Tree
        end,
        color = function()
            local buf = vim.api.nvim_get_current_buf()
            local ts = vim.treesitter.highlighter.active[buf]
            return {
                fg = ts and not vim.tbl_isempty(ts) and colors.green
                    or colors.red,
            }
        end,
        cond = conditions.hide_in_width,
    },
    lsp = {
        function()
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            if #buf_clients == 0 then
                return 'LSP Inactive'
            end

            local buf_ft = vim.bo.filetype
            local buf_client_names = {}
            -- local copilot_active = false

            -- add client
            for _, client in pairs(buf_clients) do
                if client.name ~= 'null-ls' and client.name ~= 'copilot' then
                    table.insert(buf_client_names, client.name)
                end

                -- if client.name == 'copilot' then
                --     copilot_active = true
                -- end
            end

            -- add formatter
            local formatters =
                require('user.plugins.lsp.formatters.utils.formatters')
            local supported_formatters = formatters.list_registered(buf_ft)
            vim.list_extend(buf_client_names, supported_formatters)

            -- add linter
            local linters = require('user.plugins.lsp.formatters.utils.linters')
            local supported_linters = linters.list_registered(buf_ft)
            vim.list_extend(buf_client_names, supported_linters)

            local unique_client_names = table.concat(buf_client_names, ', ')
            local language_servers = string.format('[%s]', unique_client_names)

            if copilot_active then
                language_servers = language_servers
                    .. '%#SLCopilot#'
                    .. ' '
                    .. icons.git.Octoface
                    .. '%*'
            end

            return language_servers
        end,
        color = { gui = 'bold' },
        cond = conditions.hide_in_width,
    },
    location = { 'location' },
    progress = {
        'progress',
        fmt = function()
            return '%P/%L'
        end,
        color = {},
    },

    spaces = {
        function()
            local shiftwidth = vim.api.nvim_buf_get_option(0, 'shiftwidth')
            return icons.ui.Tab .. ' ' .. shiftwidth
        end,
        padding = 1,
    },
    encoding = {
        'o:encoding',
        fmt = string.upper,
        color = {},
        cond = conditions.hide_in_width,
    },
    filetype = { 'filetype', cond = nil, padding = { left = 1, right = 1 } },
    scrollbar = {
        function()
            local current_line = vim.fn.line('.')
            local total_lines = vim.fn.line('$')
            local chars = {
                '__',
                '▁▁',
                '▂▂',
                '▃▃',
                '▄▄',
                '▅▅',
                '▆▆',
                '▇▇',
                '██',
            }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
        end,
        padding = { left = 0, right = 0 },
        color = 'SLProgress',
        cond = nil,
    },
}
