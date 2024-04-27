-- ##### AUTOFORMAT #####

-- NOTE: we use conform to format on save
--
-- TODO: fix html, css,scss, deno, svelte

-- ### FILETYPES

-- ##### SET EJS TO HTML #####

vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.ejs',
    callback = function()
        vim.cmd([[ set filetype=html ]])
    end,
})
vim.api.nvim_create_autocmd('BufRead', {
    pattern = '*.md',
    callback = function()
        vim.cmd([[ setlocal spell spelllang=en_us ]])
    end,
})

-- ##### display hints on insert mode only #####

-- vim.api.nvim_create_autocmd({ "InsertEnter" }, {
--     callback = function()
--         vim.lsp.inlay_hint.enable(0, false)
--         vim.diagnostic.disable(0)
--     end,
-- })

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--     callback = function()
--         vim.lsp.inlay_hint.enable(0, true)
--         vim.lsp.codelens.refresh(0)
--         vim.diagnostic.enable(0)
--     end,
-- })

-- LSPAttach

-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--         local bufnr = args.buf
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         -- if client.server_capabilities.completionProvider then
--         --     vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--         -- end
--         -- if client.server_capabilities.definitionProvider then
--         --     vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
--         -- end
--         vim.lsp.inlay_hint.enable(0, true)
--         vim.lsp.codelens.refresh(0)
--     end,
-- })

-- ### lazyvim
-- resize splits if window got resized
local function augroup(name)
    return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup('last_loc'),
    callback = function(event)
        local exclude = { 'gitcommit' }
        local buf = event.buf
        if
            vim.tbl_contains(exclude, vim.bo[buf].filetype)
            or vim.b[buf].lazyvim_last_loc
        then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {
        'PlenaryTestPopup',
        'help',
        'lspinfo',
        'notify',
        'qf',
        'query',
        'spectre_panel',
        'startuptime',
        'tsplayground',
        'neotest-output',
        'checkhealth',
        'neotest-summary',
        'neotest-output-panel',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set(
            'n',
            'q',
            '<cmd>close<cr>',
            { buffer = event.buf, silent = true }
        )
    end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('man_unlisted'),
    pattern = { 'man' },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ 'FileType' }, {
    group = augroup('json_conceal'),
    pattern = { 'json', 'jsonc', 'json5' },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})
