return {
    'stevearc/aerial.nvim',
    enabled = _G.user.aerial.enable,
    event = 'BufReadPre',
    opts = {
        backends = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' },
        -- backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
        -- close_automatic_events = { 'unsupported' },
        highlight_on_hover = true,
        autojump = true,
        show_guides = true,
        placement = 'edge',
        attach_mode = 'global',
        -- default_direction = "prefer_right",
        -- default_direction = 'left',

        -- ignore = {
        --     filetypes = {
        --         'oil',
        --     },
        --     buftypes = 'special',
        -- },
        -- manage_folds = true,
        -- link_folds_to_tree = true,
        open_automatic = true,
        -- lsp = {
        --     -- If true, fetch document symbols when LSP diagnostics update.
        --     diagnostics_trigger_update = true,
        --
        --     -- Set to false to not update the symbols when there are LSP errors
        --     update_when_errors = true,
        -- },
        filter_kind = false,
        --        filter_kind = {
        --   "Class",
        --   "Constructor",
        --   "Enum",
        --   "Function",
        --   "Interface",
        --   "Module",
        --   "Method",
        --   "Struct",
        -- },
    },
    -- Optional dependencies
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
}
