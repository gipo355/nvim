local M = {}

local _, builtin = pcall(require, 'telescope.builtin')
local _, finders = pcall(require, 'telescope.finders')
local _, pickers = pcall(require, 'telescope.pickers')
local _, sorters = pcall(require, 'telescope.sorters')
local _, themes = pcall(require, 'telescope.themes')
local _, actions = pcall(require, 'telescope.actions')
local _, actions_state = pcall(require, 'telescope.actions.state')
local _, previewers = pcall(require, 'telescope.previewers')
local _, make_entry = pcall(require, 'telescope.make_entry')

function M.find_project_files(opts)
    opts = opts or {}
    local ok = pcall(builtin.git_files, opts)

    if not ok then
        builtin.find_files(opts)
    end
end

--

-- local actions = require('telescope.actions')
-- local actions_state = require('telescope.actions.state')
--
-- local print_selected_entry = function(prompt_bufnr)
--     local selected_entry = actions_state.get_selected_entry()
--     vim.pretty_print(selected_entry)
--     actions.close(prompt_bufnr)
-- end
--
-- -- https://www.reddit.com/r/neovim/comments/11otu7l/using_telescope_selection_for_custom_function/
-- -- custom mappings
-- -- i want to delete all selected files
-- require('telescope.builtin').find_files({
--     attach_mappings = function(_, map)
--         map('n', '<cr>', print_selected_entry)
--         map('i', '<cr>', print_selected_entry)
--         return true
--     end,
-- })

--

-- local exec_dap = function(prompt_bufnr)
--     local selected_entry = actions_state.get_selected_entry()
--     local cpp_config = module.make_config() -- returns my basic config object with program set to a function that prompts vim.fn.input
--     cpp_config.program = './build/' .. selected_entry[1]
--     actions.close(prompt_bufnr)
--     dap.run(cpp_config)
-- end
--
-- require('telescope.builtin').find_files({
--     find_command = { 'fd', '--base-directory', './build', '-t', 'x' },
--     attach_mappings = function(_, map)
--         map('n', '<cr>', exec_dap)
--         map('i', '<cr>', exec_dap)
--         return true
--     end,
-- })

--  CUSTOM MAPPING TO DELETE ALL SELECTED FILES
--

-- -- Define a custom delete action
-- local delete = function(prompt_bufnr)
--     local current_picker =
--         actions_state.get_current_picker(prompt_bufnr)
--     local selected_entries = current_picker:get_multi_selection()
--
--     -- Loop over all selected entries and delete each file
--     for _, entry in ipairs(selected_entries) do
--         os.remove(entry[1])
--     end
--
--     -- Close the picker
--     actions.close(prompt_bufnr)
-- end

-- Use the custom delete action in your find_files mapping
-- require('telescope.builtin').find_files({
--     attach_mappings = function(_, map)
--         map('n', '<C-x>', delete)
--         -- map('i', '', actions.delete)
--         return true
--     end,
-- })

M.delete_files = function(prompt_bufnr)
    local current_picker = actions_state.get_current_picker(prompt_bufnr)
    local selected_entries = current_picker:get_multi_selection()

    -- if there are no selected entries then delete single file hovered
    if #selected_entries == 0 then
        local selected_entry = actions_state.get_selected_entry()
        os.remove(selected_entry[1])
        actions.close(prompt_bufnr)
        return
    end

    -- Loop over all selected entries and delete each file
    for _, entry in ipairs(selected_entries) do
        os.remove(entry[1])
    end

    -- Close the picker
    actions.close(prompt_bufnr)
end

return M
