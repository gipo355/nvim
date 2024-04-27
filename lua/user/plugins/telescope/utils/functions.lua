local M = {}

local _, builtin = pcall(require, 'telescope.builtin')
local _, finders = pcall(require, 'telescope.finders')
local _, pickers = pcall(require, 'telescope.pickers')
local _, sorters = pcall(require, 'telescope.sorters')
local _, themes = pcall(require, 'telescope.themes')
local _, actions = pcall(require, 'telescope.actions')
local _, previewers = pcall(require, 'telescope.previewers')
local _, make_entry = pcall(require, 'telescope.make_entry')

function M.find_project_files(opts)
    opts = opts or {}
    local ok = pcall(builtin.git_files, opts)

    if not ok then
        builtin.find_files(opts)
    end
end

return M
