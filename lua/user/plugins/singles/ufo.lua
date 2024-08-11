-- folding ( will disable folding module )
return {
    'kevinhwang91/nvim-ufo',
    enabled = _G.user.ufo.enable,
    -- event = 'BufReadPre',
    -- https://github.com/kevinhwang91/nvim-ufo/issues/235
    lazy = false,
    dependencies = {
        'kevinhwang91/promise-async',
    },

    config = function()
        local ok, ufo = pcall(require, 'ufo')

        if not ok then
            return
        end

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (' 󰁂 %d '):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix
                            .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, 'MoreMsg' })
            return newVirtText
        end

        -- 1 means show the fold column on the left
        vim.opt.foldcolumn = '1' -- '0' is not bad
        -- vim.o.foldcolumn = "0" -- '0' is not bad

        vim.keymap.set('n', 'zR', ufo.openAllFolds)
        vim.keymap.set('n', 'zM', ufo.closeAllFolds)
        vim.opt.foldexpr = nil

        vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true
        -- vim.opt.fillchars = {
        --     fold = ' ',
        --     foldopen = '',
        --     foldclose = '',
        --     foldsep = ' ',
        -- }
        -- [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

        -- LSP provider

        -- Option 2: nvim lsp as LSP client
        -- Tell the server the capability of foldingRange,
        -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities.textDocument.foldingRange = {
        --     dynamicRegistration = false,
        --     lineFoldingOnly = true,
        -- }
        -- local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        -- for _, ls in ipairs(language_servers) do
        --     require('lspconfig')[ls].setup({
        --         capabilities = capabilities,
        --         -- you can add other fields for setting up lsp server in this table
        --     })
        -- end

        ufo.setup({
            -- treesitter provider
            -- provider_selector = function(bufnr, filetype, buftype)
            --     return { 'treesitter', 'indent' }
            -- end,
            fold_virt_text_handler = handler,
        })
    end,
}
