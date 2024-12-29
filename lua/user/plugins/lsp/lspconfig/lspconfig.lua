local lsp_attach_callback =
    require('user.plugins.lsp.lspconfig.configs.lsp-attach').callback

-- TODO: add custom filetypes for lsps

-- Set the log level for the LSP server for debugging
-- in ~/.local
vim.lsp.set_log_level('off') -- off, error, warn, info, debug, trace

require('user.plugins.lsp.lspconfig.configs.global-config').setup()

return {

    {
        'nvim-java/nvim-java',
        event = 'VeryLazy',
        enabled = _G.user.java.enable,
    },

    {
        'williamboman/mason.nvim',
        event = 'VeryLazy',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
        keys = {
            {
                '<leader>lX',
                '<cmd>Mason<cr>',
                'n',
                { desc = 'mason' },
            },
        },
    },

    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        -- event = 'BufEnter',
        event = 'VeryLazy',
        -- lazy = false,
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for neovim
            { 'williamboman/mason.nvim', config = true, lazy = false },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

            { 'yioneko/nvim-vtsls', enabled = _G.user.lsp.tsserver == 'vtsls' },

            -- LSP completion plugin ( schemas )
            { 'b0o/schemastore.nvim' },

            -- Useful status updates for LSP.
            -- this shows lsp loadings in the bottom right corner, quite obnoxious
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            {
                'j-hui/fidget.nvim',
                enabled = _G.user.lsp.lsp_progress.source == 'fidget',
                opts = {
                    progress = {
                        suppress_on_insert = true,
                        ignore_done_already = true, -- Ignore new tasks that are already complete
                        ignore_empty_message = true, -- Ignore new tasks that don't contain a message
                        -- ignore = {},
                    },
                },
            },
        },
        config = function()
            -- Brief Aside: **What is LSP?**
            --
            -- LSP is an acronym you've probably heard, but might not understand what it is.
            --
            -- LSP stands for Language Server Protocol. It's a protocol that helps editors
            -- and language tooling communicate in a standardized fashion.
            --
            -- In general, you have a "server" which is some tool built to understand a particular
            -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
            -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
            -- processes that communicate with some "client" - in this case, Neovim!
            --
            -- LSP provides Neovim with features like:
            --  - Go to definition
            --  - Find references
            --  - Autocompletion
            --  - Symbol Search
            --  - and more!
            --
            -- Thus, Language Servers are external tools that must be installed separately from
            -- Neovim. This is where `mason` and related plugins come into play.
            --
            -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
            -- and elegantly composed help section, `:help lsp-vs-treesitter`

            --  This function gets run when an LSP attaches to a particular buffer.
            --    That is to say, every time a new file is opened that is associated with
            --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
            --    function will be executed to configure the current buffer

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup(
                    'kickstart-lsp-attach',
                    { clear = true }
                ),
                callback = lsp_attach_callback,
            })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP Specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.

            local capabilities = require(
                'user.plugins.lsp.lspconfig.configs.prepare-capabilities'
            ).prepare_capabilities()

            -- Enable the following language servers
            --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
            --
            --  Add any additional override configuration in the following tables. Available keys are:
            --  - cmd (table): Override the default command used to start the server
            --  - filetypes (table): Override the default list of associated filetypes for the server
            --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
            --  - settings (table): Override the default settings passed when initializing the server.
            --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

            -- ##### Add servers for automatic installation and setup with custom opts #####
            local servers = require(
                'user.plugins.lsp.lspconfig.configs.load-servers'
            ).load_servers(capabilities)

            -- Ensure the servers and tools above are installed
            --  To check the current status of installed tools and/or manually install
            --  other tools, you can run
            --    :Mason
            --
            --  You can press `g?` for help in this menu
            require('mason').setup()

            -- ADD VTSLS SERVER HERE
            -- provides more commands
            -- https://github.com/yioneko/nvim-vtsls
            if _G.user.lsp.tsserver == 'vtsls' then
                require('lspconfig.configs').vtsls = require('vtsls').lspconfig -- set default server config, optional but recommended
            end

            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.

            local ensure_installed = vim.tbl_keys(servers or {})

            require('mason-tool-installer').setup({
                ensure_installed = ensure_installed,
            })

            -- ##### Prevent those lsps to be automatically setup (but install them) #####
            -- in case you need one installed but need it inactive
            -- NOTE: lsps added here will not be automatically setup and started
            local skipped_automatic_setups = {
                tailwindcss = not _G.user.tailwindcss.enable_lsp, -- too laggy, requires special setting (hint, grep the global var to check where it's used)
                tsserver = true, -- using typescript-tools, not setting up but needed installed
                ts_ls = true, -- using typescript-tools, not setting up but needed installed
                rust_analyzer = true, -- using rustacean plugin, not setting up but needed installed
                ['rust-analyzer'] = true, -- using rustacean plugin, not setting up but needed installed
                jdtls = true, -- using nvim-java plugin, not setting up but needed installed
                sqlls = true, -- buggy as hell
                vtsls = _G.user.lsp.tsserver ~= 'vtsls', -- don't setup vtsls if not used
            }

            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        if skipped_automatic_setups[server_name] then
                            return
                        end

                        local server = servers[server_name] or {}
                        -- This handles overriding only values explicitly passed
                        -- by the server configuration above. Useful when disabling
                        -- certain features of an LSP (for example, turning off formatting for tsserver)
                        server.capabilities = vim.tbl_deep_extend(
                            'force',
                            {},
                            capabilities,
                            server.capabilities or {}
                        )
                        require('lspconfig')[server_name].setup(server)
                    end,

                    -- TODO: refactor this
                    -- java
                    jdtls = function()
                        if not _G.user.java.enable then
                            return nil
                        end

                        -- require('java').setup({})
                        require('java').setup({
                            -- Your custom jdtls settings goes here
                            -- load java test plugins
                            java_test = {
                                enable = false,
                            },
                            -- load java debugger plugins
                            java_debug_adapter = {
                                enable = _G.user.dap.enable,
                            },

                            spring_boot_tools = {
                                enable = false,
                            },

                            jdk = {
                                -- install jdk using mason.nvim
                                auto_install = true, -- setup in jdtls config
                            },

                            notifications = {
                                -- enable 'Configuring DAP' & 'DAP configured' messages on start up
                                dap = false,
                            },
                        })

                        -- NOTE: document symbols not working
                        -- require('lspconfig').jdtls.setup({})
                        require('lspconfig').jdtls.setup(
                            -- Your custom nvim-java configuration goes here
                            require(
                                'user.plugins.lsp.lspconfig.configs.server-configs.jdtls'
                            ).setup(capabilities)
                        )
                    end,
                },
            })

            -- ##### If you need to manually setup other lsps for some reason ( not needed, add to servers for custom objs ) #####
            -- manual setups for skipped LSPs

            -- we manually import jdtls because it's installed by an extension (java.nvim) and not by mason
            -- we don't want it added to the list above for autoinstall
            -- trying loading it in the plugin
            -- require('lspconfig').jdtls.setup({})
        end,
    },
}
