local merge_tables = require('user.utils.functions').merge_tables

local M = {}

M.callback = function(event)
    -- local function buf_set_option(...)
    --     vim.api.nvim_buf_set_option(event.buf, ...)
    -- end
    --Enable completion triggered by < c - x > <c-o >
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- add border to hover window
    vim.lsp.handlers['textDocument/hover'] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = 'single' })

    -- set keymap to open lspinfo and mason
    -- vim.keymap.set(
    --     'n',
    --     '<leader>lz',
    --     '<cmd>LspInfo<cr>',
    --     { buffer = event.buf, desc = 'lspinfo' }
    -- )
    vim.keymap.set(
        'n',
        '<leader>lr',
        '<cmd>LspRestart<cr>',
        { buffer = event.buf, desc = 'Lsp restart' }
    )

    -- TODO: split files

    -- TODO: inlay hints, codelens
    -- ##### Here we can laod events when LSP has started globally for all FT #####
    -- note: it's recommended to laod per FT
    vim.lsp.inlay_hint.enable()
    -- vim.lsp.codelens.refresh(event.buf)
    -- vim.lsp.diagnostic.enable(event.buf)

    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(mode, keys, func, desc, ...)
        local rest_opts = ...
        local opts = { buffer = event.buf, desc = 'LSP: ' .. desc }

        vim.keymap.set(
            mode,
            keys,
            func,
            -- { buffer = event.buf, desc = 'LSP: ' .. desc, opts }
            merge_tables(opts, rest_opts)
        )
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-T>.
    -- map(
    --     'gd',
    --     require('telescope.builtin').lsp_definitions,
    --     '[G]oto [D]efinition'
    -- )

    -- Find references for the word under your cursor.
    -- map(
    --     'gr',
    --     require('telescope.builtin').lsp_references,
    --     '[G]oto [R]eferences'
    -- )
    map('n', 'gr', vim.lsp.buf.references, '[g] [r]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    -- map(
    --     'gI',
    --     require('telescope.builtin').lsp_implementations,
    --     '[G]oto [I]mplementation'
    -- )
    map('n', 'gi', vim.lsp.buf.implementation, '[g] [i]mplementation')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    -- map(
    --     '<leader>D',
    --     require('telescope.builtin').lsp_type_definitions,
    --     'Type [D]efinition'
    -- )

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    -- map(
    --     '<leader>ds',
    --     require('telescope.builtin').lsp_document_symbols,
    --     '[D]ocument [S]ymbols'
    -- )

    -- Fuzzy find all the symbols in your current workspace
    --  Similar to document symbols, except searches over your whole project.
    -- map(
    --     '<leader>ws',
    --     require('telescope.builtin').lsp_dynamic_workspace_symbols,
    --     '[W]orkspace [S]ymbols'
    -- )

    -- Rename the variable under your cursor ( using lspsaga instead )
    --  Most Language Servers support renaming across files, etc.
    -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- map('<leader>vr', vim.lsp.buf.rename, '[v] [r]ename')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('n', '<leader>vA', vim.lsp.buf.code_action, '[V] Code [A]ctions')
    map('v', '<leader>vA', vim.lsp.buf.code_action, '[V] [A]ctions')

    -- from lvim

    -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    -- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    -- f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
    map('n', '<leader>lF', vim.lsp.buf.format, 'format')
    -- i = { "<cmd>LspInfo<cr>", "Info" },
    map('n', '<leader>li', '<cmd>LspInfo<cr>', 'lspinfo')
    -- I = { "<cmd>Mason<cr>", "Mason Info" },
    -- map('n', '<leader>lI', '<cmd>Mason<cr>', 'mason info')
    -- j = {
    --   "<cmd>lua vim.diagnostic.goto_next()<cr>",
    --   "Next Diagnostic",
    -- },
    map('n', '<leader>lj', vim.diagnostic.goto_next, 'next diagnostic')
    -- k = {
    --   "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    --   "Prev Diagnostic",
    -- },
    map('n', '<leader>lk', vim.diagnostic.goto_prev, 'prev diagnostic')
    -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    map('n', '<leader>ll', vim.lsp.codelens.run, '[V] Run [L]ens')
    map('n', '<leader>lL', vim.lsp.codelens.refresh, 'Refresh [L]ens')
    -- q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    map(
        'n',
        '<leader>lq',
        vim.diagnostic.setloclist,
        'send diagnostic to quickfix'
    )
    -- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    -- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    -- S = {
    --   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --   "Workspace Symbols",
    -- },
    -- e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap
    -- map('K', vim.lsp.buf.hover, 'Hover Documentation')
    local show_documentation = function()
        local filetype = vim.bo.filetype
        if vim.tbl_contains({ 'vim', 'help' }, filetype) then
            vim.cmd('h ' .. vim.fn.expand('<cword>'))
        elseif vim.tbl_contains({ 'man' }, filetype) then
            vim.cmd('Man ' .. vim.fn.expand('<cword>'))
        elseif vim.fn.expand('%:t') == 'Cargo.toml' then
            require('crates').show_popup()
        else
            vim.lsp.buf.hover()
        end
    end
    map('n', 'K', show_documentation, 'Hover Documentation')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header
    -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    --
    -- highlight word under cursor by lsp, bugged in html and laggish
    --
    -- local client =
    --     vim.lsp.get_client_by_id(event.data.client_id)
    -- if
    --     client
    --     and client.server_capabilities.documentHighlightProvider
    -- then
    --     vim.api.nvim_create_autocmd(
    --         { 'CursorHold', 'CursorHoldI' },
    --         {
    --             buffer = event.buf,
    --             callback = vim.lsp.buf.document_highlight,
    --         }
    --     )
    --
    --     vim.api.nvim_create_autocmd(
    --         { 'CursorMoved', 'CursorMovedI' },
    --         {
    --             buffer = event.buf,
    --             callback = vim.lsp.buf.clear_references,
    --         }
    --     )
    -- end

    -- override to map and provide refactoring functions
    vim.keymap.set(
        { 'n', 'v' },
        '<C-c>',
        -- ':Lspsaga code_action<cr>',
        vim.lsp.buf.code_action,
        { buffer = event.buf, desc = 'lsp code action' }
    )
end

return M
