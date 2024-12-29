local M = {}
M.setup = function(capabilities)
    return {

        capabilities = capabilities,
        flags = {
            -- https://www.reddit.com/r/neovim/comments/1guifug/comment/lxuzjhn/
            -- https://github.com/gonstoll/dotfiles/blob/master/.config/nvim/lua/plugins/lsp/servers/eslint.lua#L11-L14
            -- debounce_text_changes = 500
            allow_incremental_sync = false,
            debounce_text_changes = 1000,
        },
        on_attach = function(client, bufnr)
            -- [https://www.reddit.com/r/neovim/comments/ultmx0/how_to_setup_eslint_to_format_on_save_with_nvims/]
            client.server_capabilities.documentFormattingProvider = true
            -- if client.server_capabilities.documentFormattingProvider then
            --   local au_lsp = vim.api.nvim_create_augroup('eslint_lsp', { clear = true })
            --   vim.api.nvim_create_autocmd('BufWritePre', {
            --     pattern = '*',
            --     callback = function()
            --       vim.lsp.buf.format { async = true }
            --     end,
            --     group = au_lsp,
            --   })
            -- end
        end,

        --need autocmd at the end
        --root_dir = require("lspconfig").util.root_pattern { ".git" },
        filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
            'vue',
            'svelte',
            'html',
            'astro',
            'json',
            'jsonc',
            'json5',
            'angular.html',
        },
        settings = {
            validate = 'on',
            format = true,
            --packageManager = 'pnpm',
            codeActionOnSave = {
                enable = true,
                mode = 'all',
            },
        },
    }
end
return M
