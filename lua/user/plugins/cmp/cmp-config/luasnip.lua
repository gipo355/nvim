local M = {}

M.setup_luasnip = function()
    local luasnip = require('luasnip')

    -- local SelectBehavior = cmp_types_cmp.SelectBehavior
    -- local cmp_window = require('cmp.config.window')

    local utils = require('user.utils.functions')

    local paths = {}

    -- SETUP: snippets

    -- TODO: do they have any problems?
    paths[#paths + 1] = utils.join_paths(
        utils.get_runtime_dir(),
        'site',
        'pack',
        'lazy',
        'opt',
        'friendly-snippets'
    )

    local user_snippets =
        utils.join_paths(utils.get_config_dir(), 'lua', 'user', 'snippets')

    if utils.is_directory(user_snippets) then
        paths[#paths + 1] = user_snippets
    end

    require('luasnip.loaders.from_lua').lazy_load()

    require('luasnip.loaders.from_vscode').lazy_load({
        paths = paths,
    })

    require('luasnip.loaders.from_snipmate').lazy_load()

    luasnip.config.setup({})

    luasnip.setup({
        histofy = true,
        delete_check_events = 'TextChanged',
    })
end

return M
