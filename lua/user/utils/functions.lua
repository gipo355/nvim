-- thanks lunarvim

local M = {}
local uv = vim.loop
local global_opts = require('user.utils.options')

-- recursive Print (structure, limit, separator)
local function r_inspect_settings(structure, limit, separator)
    limit = limit or 100 -- default item limit
    separator = separator or '.' -- indent string
    if limit < 1 then
        print('ERROR: Item limit reached.')
        return limit - 1
    end
    if structure == nil then
        io.write('-- O', separator:sub(2), ' = nil\n')
        return limit - 1
    end
    local ts = type(structure)

    if ts == 'table' then
        for k, v in pairs(structure) do
            -- replace non alpha keys with ["key"]
            if tostring(k):match('[^%a_]') then
                k = '["' .. tostring(k) .. '"]'
            end
            limit =
                r_inspect_settings(v, limit, separator .. '.' .. tostring(k))
            if limit < 0 then
                break
            end
        end
        return limit
    end

    if ts == 'string' then
        -- escape sequences
        structure = string.format('%q', structure)
    end
    separator = separator:gsub('%.%[', '%[')
    if type(structure) == 'function' then
        -- don't print functions
        io.write('-- lvim', separator:sub(2), ' = function ()\n')
    else
        io.write('lvim', separator:sub(2), ' = ', tostring(structure), '\n')
    end
    return limit - 1
end

function M.generate_settings()
    -- Opens a file in append mode
    local file = io.open('lv-settings.lua', 'w')

    -- sets the default output file as test.lua
    io.output(file)

    -- write all `lvim` related settings to `lv-settings.lua` file
    r_inspect_settings(lvim, 10000, '.')

    -- closes the open file
    io.close(file)
end

--- Returns a table with the default values that are missing.
--- either parameter can be empty.
--@param config (table) table containing entries that take priority over defaults
--@param default_config (table) table contatining default values if found
function M.apply_defaults(config, default_config)
    config = config or {}
    default_config = default_config or {}
    local new_config = vim.tbl_deep_extend('keep', vim.empty_dict(), config)
    new_config = vim.tbl_deep_extend('keep', new_config, default_config)
    return new_config
end

--- Checks whether a given path exists and is a file.
--@param path (string) path to check
--@returns (bool)
function M.is_file(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == 'file' or false
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
function M.is_directory(path)
    local stat = uv.fs_stat(path)
    return stat and stat.type == 'directory' or false
end

local path_sep = uv.os_uname().version:match('Windows') and '\\' or '/'
M.join_paths = function(...)
    local result = table.concat({ ... }, path_sep)
    return result
end

function M.get_runtime_dir()
    return vim.call('stdpath', 'data')
end

function M.get_config_dir()
    return vim.call('stdpath', 'config')
end

function M.get_cache_dir()
    return vim.call('stdpath', 'cache')
end

---Write data to a file
---@param path string can be full or relative to `cwd`
---@param txt string|table text to be written, uses `vim.inspect` internally for tables
---@param flag string used to determine access mode, common flags: "w" for `overwrite` or "a" for `append`
function M.write_file(path, txt, flag)
    local data = type(txt) == 'string' and txt or vim.inspect(txt)
    uv.fs_open(path, flag, 438, function(open_err, fd)
        assert(not open_err, open_err)
        uv.fs_write(fd, data, -1, function(write_err)
            assert(not write_err, write_err)
            uv.fs_close(fd, function(close_err)
                assert(not close_err, close_err)
            end)
        end)
    end)
end

---Copies a file or directory recursively
---@param source string
---@param destination string
function M.fs_copy(source, destination)
    local source_stats = assert(vim.loop.fs_stat(source))

    if source_stats.type == 'file' then
        assert(vim.loop.fs_copyfile(source, destination))
        return
    elseif source_stats.type == 'directory' then
        local handle = assert(vim.loop.fs_scandir(source))

        assert(vim.loop.fs_mkdir(destination, source_stats.mode))

        while true do
            local name = vim.loop.fs_scandir_next(handle)
            if not name then
                break
            end

            M.fs_copy(
                M.join_paths(source, name),
                M.join_paths(destination, name)
            )
        end
    end
end

function M.env_cleanup(venv)
    if string.find(venv, '/') then
        local final_venv = venv
        for w in venv:gmatch('([^/]+)') do
            final_venv = w
        end
        venv = final_venv
    end
    return venv
end

M.vim_version = vim.inspect(vim.version())

M.nvimGreaterThan = function(major, minor, patch)
    if
        M.vim_version.major > version
        and M.vim_version.minor > minor
        and M.vim_version.patch > patch
    then
        return true
    end
    return false
end

---@param ... (table) list of tables to merge_tables
---@returns (table) merged table
M.merge_tables = function(...) -- BUG: doesn't work on keymaps
    local end_table = {}
    local src_tables = { ... }
    for _, table in ipairs(src_tables) do
        for k, v in pairs(table) do
            end_table[k] = v
        end
    end
    -- for k, v in pairs(src) do
    --     dst[k] = v
    -- end
    return end_table -- for convenience (chaining)
end

M.toggle_hints = function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

M.toggle_diagnostics = function()
    if vim.diagnostic.is_disabled() then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

M.toggle_all = function()
    M.toggle_hints()
    -- toggle_diagnostics()
end

M.set_transparent_bg = function(is_transparent)
    if vim.g.neovide then
        return false
    else
        -- change to true to enable transparent background
        return is_transparent
    end
end

---Set keymap opts with default options
---@param desc (string) description of the keymap
---@param ... (table) additional options to merge with default options
---@returns (table)
M.set_keymap_desc = function(desc, ...)
    -- merge_tables(keymap_opts, { desc = "['] Fuzzy current buffer" })
    return M.merge_tables(global_opts.global_keymap_opts, { desc = desc }, ...)
end

return M
