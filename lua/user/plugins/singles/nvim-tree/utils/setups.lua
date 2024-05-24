-- FROM LUNARVIM

local M = {}

local generic_opts_any = { noremap = true, silent = true }

local generic_opts = {
    insert_mode = generic_opts_any,
    normal_mode = generic_opts_any,
    visual_mode = generic_opts_any,
    visual_block_mode = generic_opts_any,
    command_mode = generic_opts_any,
    operator_pending_mode = generic_opts_any,
    term_mode = { silent = true },
}

-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
    local opt = generic_opts[mode] or generic_opts_any
    if type(val) == 'table' then
        opt = val[2]
        val = val[1]
    end
    if val then
        vim.keymap.set(mode, key, val, opt)
    else
        pcall(vim.api.nvim_del_keymap, mode, key)
    end
end

function M.start_telescope(telescope_mode)
    local node = require('nvim-tree.lib').get_node_at_cursor()
    local abspath = node.link_to or node.absolute_path
    local is_folder = node.open ~= nil
    local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ':h')
    require('telescope.builtin')[telescope_mode]({
        cwd = basedir,
    })
end

local mode_adapters = {
    insert_mode = 'i',
    normal_mode = 'n',
    term_mode = 't',
    visual_mode = 'v',
    visual_block_mode = 'x',
    command_mode = 'c',
    operator_pending_mode = 'o',
}

function M.load_mode(mode, keymaps)
    mode = mode_adapters[mode] or mode
    for k, v in pairs(keymaps) do
        M.set_keymaps(mode, k, v)
    end
end

function M.on_attach(bufnr)
    -- nvimtree keymaps

    local api = require('nvim-tree.api')

    -- local function telescope_find_files(_)
    --     require('lvim.core.nvimtree').start_telescope('find_files')
    -- end
    --
    -- local function telescope_live_grep(_)
    --     require('lvim.core.nvimtree').start_telescope('live_grep')
    -- end

    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)

    local useful_keys = {
        ['l'] = { api.node.open.edit, opts('Open') },
        ['o'] = { api.node.open.edit, opts('Open') },
        ['<CR>'] = { api.node.open.edit, opts('Open') },
        ['v'] = { api.node.open.vertical, opts('Open: Vertical Split') },
        ['h'] = { api.node.navigate.parent_close, opts('Close Directory') },
        ['C'] = { api.tree.change_root_to_node, opts('CD') },
        -- ['gtg'] = { telescope_live_grep, opts('Telescope Live Grep') },
        -- ['gtf'] = { telescope_find_files, opts('Telescope Find File') },
    }

    -- custom mappings
    -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

    M.load_mode('n', useful_keys)

    -- remove annoying c-e mapping, scroll up default instead
    vim.keymap.del(
        'n',
        '<C-e>',
        { buffer = bufnr, desc = 'nvim-tree: Scroll Down' }
    )
end

-- function M.setup()
--     local status_ok, nvim_tree = pcall(require, 'nvim-tree')
--
--     if not status_ok then
--         Log:error('Failed to load nvim-tree')
--         return
--     end
--
--     -- Implicitly update nvim-tree when project module is active
--     if lvim.builtin.project.active then
--         lvim.builtin.nvimtree.setup.respect_buf_cwd = true
--         lvim.builtin.nvimtree.setup.update_cwd = true
--         lvim.builtin.nvimtree.setup.update_focused_file.enable = true
--         lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = true
--     end
--
--     -- Add useful keymaps
--     if lvim.builtin.nvimtree.setup.on_attach == 'default' then
--         lvim.builtin.nvimtree.setup.on_attach = on_attach
--     end
--
--     nvim_tree.setup(lvim.builtin.nvimtree.setup)
--
--     if lvim.builtin.nvimtree.on_config_done then
--         lvim.builtin.nvimtree.on_config_done(nvim_tree)
--     end
-- end

return M
