-- from lunarvim

local M = {}

-- BUG:
-- TODO:
-- fix lazygit lag vs the other version (in commit popu)

-- set up the default execs, terminal keymaps
-- cmd, keymap, label, direction, size, float_opts, hidden, dir
local execs = {
    {
        nil,
        '<M-1>',
        'Horizontal Terminal',
        'horizontal',
        0.3,
        {},
        true,
        nil,
    },
    {
        nil,
        '<M-2>',
        'Vertical Terminal',
        'vertical',
        0.4,
        {},
        true,
        nil,
    },
    {
        nil,
        '<M-3>',
        'Float Terminal',
        'float',
        nil,
        {},
        true,
        nil,
    },
    {
        'gdu',
        '<M-4>',
        'gdu terminal',
        'float',
        nil,
        {},
        true,
        nil,
    },
    {
        'btop',
        '<M-5>',
        'Btop',
        'float',
        nil,
        {
            border = 'none',
            width = 100000,
            height = 100000,
        },
        true,
        'git_dir',
    },

    -- TODO: fix lazygit lag vs the other version (in commit)
    -- using lazygit plugin for now
    {
        'lazygit',
        '<c-g>',
        'LazyGit',
        'float',
        nil,
        {
            border = 'none',
            width = 100000,
            height = 100000,
        },
        true,
        'git_dir',
    },
    {
        'ollama run codellama',
        '<leader>mo',
        'Ollama',
        'vertical',
        0.5,
        {},
        true,
        nil,
    },
    {
        'lazydocker',
        '<m-d>',
        'LazyDocker',
        'float',
        nil,
        {
            border = 'none',
            width = 100000,
            height = 100000,
        },
        true,
        'git_dir',
    },
    {
        'sudo termshark',
        '<m-6>',
        'LazyDocker',
        'float',
        nil,
        {
            border = 'none',
            width = 100000,
            height = 100000,
        },
        true,
        'git_dir',
    },
    -- missing dir and float opts
}

--- Get current buffer size
---@return {width: number, height: number}
function M.get_buf_size()
    local cbuf = vim.api.nvim_get_current_buf()
    local bufinfo = vim.tbl_filter(function(buf)
        return buf.bufnr == cbuf
    end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
    if bufinfo == nil then
        return { width = -1, height = -1 }
    end
    return { width = bufinfo.width, height = bufinfo.height }
end

--- Get the dynamic terminal size in cells
---@param direction string
---@param size number
---@return integer
function M.get_dynamic_terminal_size(direction, size)
    size = size or 20
    if direction ~= 'float' and tostring(size):find('.', 1, true) then
        size = math.min(size, 1.0)
        local buf_sizes = M.get_buf_size()
        local buf_size = direction == 'horizontal' and buf_sizes.height
            or buf_sizes.width
        return buf_size * size
    else
        return size
    end
end

M._exec_toggle = function(opts)
    local Terminal = require('toggleterm.terminal').Terminal
    local term = Terminal:new({
        cmd = opts.cmd,
        count = opts.count,
        direction = opts.direction,
        hidden = opts.hidden,
        float_opts = opts.float_opts,
        dir = opts.dir,
    })
    term:toggle(opts.size, opts.direction)
end

M.add_exec = function(opts)
    local binary = opts.cmd:match('(%S+)')
    if vim.fn.executable(binary) ~= 1 then
        return
    end

    vim.keymap.set({ 'n', 't' }, opts.keymap, function()
        M._exec_toggle({
            cmd = opts.cmd,
            count = opts.count,
            direction = opts.direction,
            size = opts.size(),
            hidden = opts.hidden,
            float_opts = opts.float_opts,
            dir = opts.dir,
        })
    end, { desc = opts.label, noremap = true, silent = true })
end

M.init = function()
    for i, exec in pairs(execs) do
        local direction = exec[4] or 'float'

        local opts = {
            cmd = exec[1] or vim.o.shell,
            keymap = exec[2],
            label = exec[3],
            -- NOTE: unable to consistently bind id/count <= 9, see #2146
            count = i + 100,
            direction = direction,
            size = function()
                return M.get_dynamic_terminal_size(direction, exec[5])
            end,
            float_opts = exec[6],
            hidden = exec[7],
            dir = exec[8],
        }

        M.add_exec(opts)
    end
end

---Toggles a log viewer according to log.viewer.layout_config
---@param logfile string the fullpath to the logfile
-- M.toggle_log_view = function(logfile)
--     local log_viewer = lvim.log.viewer.cmd
--     if vim.fn.executable(log_viewer) ~= 1 then
--         log_viewer = 'less +F'
--     end
--     Log:debug('attempting to open: ' .. logfile)
--     log_viewer = log_viewer .. ' ' .. logfile
--     local term_opts = vim.tbl_deep_extend('force', lvim.builtin.terminal, {
--         cmd = log_viewer,
--         open_mapping = lvim.log.viewer.layout_config.open_mapping,
--         direction = lvim.log.viewer.layout_config.direction,
--         -- TODO: this might not be working as expected
--         size = lvim.log.viewer.layout_config.size,
--         float_opts = lvim.log.viewer.layout_config.float_opts,
--     })
--
--     local Terminal = require('toggleterm.terminal').Terminal
--     local log_view = Terminal:new(term_opts)
--     log_view:toggle()
-- end

return M
