-- TODO: refacor this mess, split per language, check lazyvim

-- TODO: add custom filetypes for lsps

-- define symbols for lsp
-- vim.fn.sign_define('LspDiagnosticsSignError', {
--     texthl = 'LspDiagnosticsSignError',
--     text = '',
--     numhl = 'LspDiagnosticsSignError',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignWarning', {
--     texthl = 'LspDiagnosticsSignWarning',
--     text = '⚠',
--     numhl = 'LspDiagnosticsSignWarning',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignHint', {
--     texthl = 'LspDiagnosticsSignHint',

--     text = '', -- TODO: fix icon

--     numhl = 'LspDiagnosticsSignHint',
-- })
-- vim.fn.sign_define('LspDiagnosticsSignInformation', {
--     texthl = 'LspDiagnosticsSignInformation',
--     text = '',
--     numhl = 'LspDiagnosticsSignInformation',
-- })

-- ## lsp log, turn on for debugging, writes to ~/.local/state/nvim/lsp.log
vim.lsp.set_log_level('off') -- off, error, warn, info, debug

vim.filetype.add({
    pattern = {
        ['.*%.component%.html'] = 'angular.html', -- Sets the filetype to `angular.html` if it matches the pattern
    },
    extension = {
        templ = 'templ', -- golang atempl
        zsh = 'sh',
        -- http = 'http',
    },
    filename = {
        ['.zshrc'] = 'sh',
        ['.zshenv'] = 'sh',
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'angular.html',
    callback = function()
        vim.treesitter.language.register('angular', 'angular.html') -- Register the filetype with treesitter for the `angular` language/parser
    end,
})

vim.g.markdown_fenced_languages = {
    'ts=typescript',
}

return {
    {
        'williamboman/mason.nvim',
        event = 'BufEnter',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },

    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        event = 'BufEnter',
        lazy = false,
        dependencies = {
            -- JAVA: must be run before lspconfig is setup
            {
                -- TODO: possibly set it up from lvim, chris config
                'nvim-java/nvim-java',
                dependencies = {
                    'nvim-java/lua-async-await',
                    'nvim-java/nvim-java-core',
                    'nvim-java/nvim-java-test',
                    'nvim-java/nvim-java-dap',
                    'MunifTanjim/nui.nvim',
                    'neovim/nvim-lspconfig',
                    'mfussenegger/nvim-dap',
                    {
                        'williamboman/mason.nvim',
                        opts = {
                            registries = {
                                'github:nvim-java/mason-registry',
                                'github:mason-org/mason-registry',
                            },
                        },
                    },
                },
                config = function()
                    require('java').setup()
                end,
            },
            -- Automatically install LSPs and related tools to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- LSP completion plugin ( schemas )
            'b0o/schemastore.nvim',

            -- Useful status updates for LSP.
            -- this shows lsp loadings in the bottom right corner, quite obnoxious
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            -- {
            --     'j-hui/fidget.nvim',
            --     opts = {
            --         progress = {
            --             suppress_on_insert = true,
            --             ignore_done_already = true, -- Ignore new tasks that are already complete
            --             ignore_empty_message = true, -- Ignore new tasks that don't contain a message
            --             -- ignore = {},
            --         },
            --     },
            -- },
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
                callback = function(event)
                    local merge_tables =
                        require('user.utils.functions').merge_tables
                    -- local function buf_set_option(...)
                    --     vim.api.nvim_buf_set_option(event.buf, ...)
                    -- end
                    --Enable completion triggered by < c - x > <c-o >
                    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[event.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- add border to hover window
                    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                        vim.lsp.handlers.hover,
                        { border = 'single' }
                    )

                    -- set keymap to open lspinfo and mason
                    vim.keymap.set(
                        'n',
                        '<leader>lz',
                        '<cmd>LspInfo<cr>',
                        { buffer = event.buf, desc = 'lspinfo' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>lX',
                        '<cmd>Mason<cr>',
                        { buffer = event.buf, desc = 'mason' }
                    )

                    -- TODO: split files

                    -- TODO: inlay hints, codelens
                    -- ##### Here we can laod events when LSP has started #####
                    -- vim.lsp.inlay_hint.enable()
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
                        local opts =
                            { buffer = event.buf, desc = 'LSP: ' .. desc }

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
                    map(
                        'n',
                        'gi',
                        vim.lsp.buf.implementation,
                        '[g] [i]mplementation'
                    )

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
                    map(
                        'n',
                        '<leader>vA',
                        vim.lsp.buf.code_action,
                        '[V] Code [A]ctions'
                    )
                    map(
                        'v',
                        '<leader>vA',
                        vim.lsp.buf.code_action,
                        '[V] [A]ctions'
                    )

                    -- from lvim

                    -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
                    -- d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
                    -- w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
                    -- f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
                    map('n', '<leader>lF', vim.lsp.buf.format, 'format')
                    -- i = { "<cmd>LspInfo<cr>", "Info" },
                    map('n', '<leader>li', '<cmd>LspInfo', 'lspinfo')
                    -- I = { "<cmd>Mason<cr>", "Mason Info" },
                    map('n', '<leader>lI', '<cmd>Mason<cr>', 'mason info')
                    -- j = {
                    --   "<cmd>lua vim.diagnostic.goto_next()<cr>",
                    --   "Next Diagnostic",
                    -- },
                    map(
                        'n',
                        '<leader>lj',
                        vim.diagnostic.goto_next,
                        'next diagnostic'
                    )
                    -- k = {
                    --   "<cmd>lua vim.diagnostic.goto_prev()<cr>",
                    --   "Prev Diagnostic",
                    -- },
                    map(
                        'n',
                        '<leader>lk',
                        vim.diagnostic.goto_prev,
                        'prev diagnostic'
                    )
                    -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
                    map(
                        'n',
                        '<leader>ll',
                        vim.lsp.codelens.run,
                        '[V] Run [L]ens'
                    )
                    map(
                        'n',
                        '<leader>lL',
                        vim.lsp.codelens.refresh,
                        'Refresh [L]ens'
                    )
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
                end,
            })

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP Specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')

            if ok then
                capabilities = vim.tbl_deep_extend(
                    'force',
                    capabilities,
                    require('cmp_nvim_lsp').default_capabilities()
                )
            end
            capabilities.textDocument.completion.completionItem.snippetSupport =
                true

            -- TODO: check if this is needed
            -- what is this? says it imrpoves performance
            -- https://www.reddit.com/r/neovim/comments/161tv8l/lsp_has_gotten_very_slow/
            -- https://www.reddit.com/r/neovim/comments/1b4bk5h/psa_new_fswatch_watchfunc_backend_available_on/
            -- this is an alternative to fswatch. no need to add this if you have fswatch
            -- improves performance
            -- workspace/didChangeWatchedFiles LSP client capability is now enabled by default
            -- BUG: breaks tailwindcss lsp if set to true (or commented which means use fswatch)
            -- watch for file changes (default: true)
            if _G.user.enable_tailwindcss then
                capabilities.workspace.didChangeWatchedFiles = {
                    dynamicRegistration = false,
                }
            end

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
            local servers = {
                -- clangd = {},
                -- pyright = {},
                -- rust_analyzer = {},
                -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
                --
                -- Some languages (like typescript) have entire language plugins that can be useful:
                --    https://github.com/pmizio/typescript-tools.nvim
                --
                -- But for many setups, the LSP (`tsserver`) will work just fine
                -- tsserver = {},
                --

                unocss = {
                    filetypes = {
                        'css',
                        'scss',
                        'less',
                        'html',
                        'astro',
                        'svelte',
                        'angular.html',
                        'javascriptreact',
                        'rescript',
                        'typescriptreact',
                        'vue',
                    },
                },

                cssls = {
                    filetypes = {
                        'css',
                        'scss',
                        'less',
                        'html',
                        'astro',
                        'svelte',
                        'angular.html',
                    },
                    capabilities = capabilities,
                    --root_dir = { ".git" }
                },

                cssmodules_ls = {
                    filetypes = {
                        'css',
                        'scss',
                        'less',
                        'html',
                        'astro',
                        'svelte',
                        'angular.html',
                    },
                    --root_dir = { ".git" }
                },

                -- snyk_ls = {
                --     init_options = {
                --         -- token = '',
                --         token = require('user.env').SNYK_TOKEN,
                --         activateSnykOpenSource = 'true',
                --         activateSnykIac = 'true',
                --         enableTrustedFoldersFeature = 'false',
                --         integrationName = 'NEOVIM',
                --         -- additionalParams = '--all-projects', -- Any extra params for the Snyk CLI, separated by spaces
                --         scanningMode = 'auto',
                --         organization = 'gipo355',
                --         authenticationMethod = 'token',
                --         activateSnykCodeSecurity = 'true',
                --         activateSnykCodeQuality = 'true',
                --         enableTelemetry = 'false',
                --         -- "snykCodeApi": "https://deeproxy.snyk.io",
                --         filterSeverity = {
                --             --   // Filters to be applied for the determined issues
                --             critical = true,
                --             high = true,
                --             medium = true,
                --             low = true,
                --         },
                --     },
                -- },

                omnisharp = {
                    capabilities = capabilities,
                    root_dir = require('lspconfig').util.root_pattern(
                        '*.csproj',
                        'project.json',
                        '*.sln',
                        'omnisharp.json',
                        'function.json',
                        'global.json',
                        '.git'
                    ),

                    -- cmd = {
                    --     "dotnet",
                    --     "/home/wolf/.local/share/lvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
                    -- },

                    -- Enables support for reading code style, naming convention and analyzer
                    -- settings from .editorconfig.
                    enable_editorconfig_support = true,

                    -- If true, MSBuild project system will only load projects for files that
                    -- were opened in the editor. This setting is useful for big C# codebases
                    -- and allows for faster initialization of code navigation features only
                    -- for projects that are relevant to code that is being edited. With this
                    -- setting enabled OmniSharp may load fewer projects and may thus display
                    -- incomplete reference lists for symbols.
                    enable_ms_build_load_projects_on_demand = false,

                    -- Enables support for roslyn analyzers, code fixes and rulesets.
                    enable_roslyn_analyzers = true,

                    -- Specifies whether 'using' directives should be grouped and sorted during
                    -- document formatting.
                    organize_imports_on_format = true,

                    -- Enables support for showing unimported types and unimported extension
                    -- methods in completion lists. When committed, the appropriate using
                    -- directive will be added at the top of the current file. This option can
                    -- have a negative impact on initial completion responsiveness,
                    -- particularly for the first few completion sessions after opening a
                    -- solution.
                    enable_import_completion = true,

                    -- Specifies whether to include preview versions of the .NET SDK when
                    -- determining which version to use for project loading.
                    sdk_include_prereleases = true,

                    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                    -- true
                    analyze_open_documents_only = false,
                },

                html = {
                    filetypes = {
                        'html',
                        'svelte',
                        'templ',
                        'angular.html',
                    },
                },

                emmet_language_server = {

                    filetypes = {
                        'css',
                        'eruby',
                        'html',
                        'htmldjango',
                        'javascriptreact',
                        'less',
                        'pug',
                        'sass',
                        'scss',
                        'typescriptreact',
                        'templ',
                        'svelte',
                        'angular.html',
                    },
                },

                -- htmx = {
                --     filetypes = {
                --         'html',
                --         'templ',
                --         'angular.html',
                --     },
                -- },

                gopls = {
                    -- https://github.com/Integralist/nvim/blob/main/lua/plugins/lsp.lua#L10-L92
                    on_attach = function()
                        -- vim.lsp.inlay_hint.enable() -- uncomment to enable inlay hints for go
                    end,
                    filetypes = { 'go', 'gomod', 'gowork', 'templ', 'gotmpl' },
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            directoryFilters = {
                                '-.git',
                                '-.vscode',
                                '-.idea',
                                '-.vscode-test',
                                '-node_modules',
                            },
                            semanticTokens = true,
                            analyses = {
                                fieldalignment = true,
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            hints = {
                                -- which?
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                constantValues = true,
                                parameterNames = true,
                                compositeLiteralTypes = true,
                                functionTypeParameters = true,
                                rangeVariableTypes = true,
                            },
                            -- ['ui.inlayhint.hints'] = {
                            --     assignVariableTypes = true,
                            --     compositeLiteralFields = true,
                            --     constantValues = true,
                            --     parameterNames = true,
                            --     compositeLiteralTypes = true,
                            --     functionTypeParameters = true,
                            --     rangeVariableTypes = true,
                            -- },
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            experimentalPostfixCompletions = true,
                            -- DISABLED: staticcheck
                            --
                            -- gopls doesn't invoke the staticcheck binary.
                            -- Instead it imports the analyzers directly.
                            -- This means it can report on issues the binary can't.
                            -- But it's not a good thing (like it initially sounds).
                            -- You can't then use line directives to ignore issues.
                            --
                            -- Instead of using staticcheck via gopls.
                            -- We have golangci-lint execute it instead.
                            --
                            -- For more details:
                            -- https://github.com/golang/go/issues/36373#issuecomment-570643870
                            -- https://github.com/golangci/golangci-lint/issues/741#issuecomment-1488116634
                            --
                            -- staticcheck = true,
                            gofumpt = true,
                            usePlaceholders = true,
                        },
                    },
                    -- settings = {
                    --     hint = {
                    --         enable = true,
                    --     },
                    -- }
                },

                -- golangci_lint_ls = {
                --     filetypes = { 'go', 'gomod', 'gowork', 'templ', 'gotmpl' },
                --     init_options = {
                --         command = {
                --             'golangci-lint',
                --             'run',
                --             '--out-format',
                --             'json',
                --             --         "-c",
                --             --         "~/.golangci.yml",
                --             -- "--issues-exit-code=1",
                --             -- '--fix',
                --             '--issues-exit-code=1',
                --         },
                --     },
                -- },

                intelephense = {
                    filetypes = { 'php' },
                    root_dir = require('lspconfig').util.root_pattern(
                        'composer.json',
                        '.git'
                    ),
                },
                phpactor = {
                    filetypes = { 'php' },
                    root_dir = require('lspconfig').util.root_pattern(
                        'composer.json',
                        '.git'
                    ),
                },

                eslint = {

                    capabilities = capabilities,
                    flags = { debounce_text_changes = 500 },
                    on_attach = function(client, bufnr)
                        -- [https://www.reddit.com/r/neovim/comments/ultmx0/how_to_setup_eslint_to_format_on_save_with_nvims/]
                        client.server_capabilities.documentFormattingProvider =
                            true
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
                },

                jsonls = {
                    settings = {
                        json = {
                            schemas = require('schemastore').json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },

                helm_ls = {},

                yamlls = {
                    filetypes = { 'yaml', 'yml' },
                    settings = {
                        yaml = {
                            schemaStore = {
                                -- You must disable built-in schemaStore support if you want to use
                                -- this plugin and its advanced options like `ignore`.
                                enable = false,
                                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                                url = '',
                            },
                            -- shemas = require('schemastore').yaml.schemas(),
                            schemas = {
                                kubernetes = '*.k8s.yaml',
                                ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*',
                                ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
                                ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
                                ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
                                ['http://json.schemastore.org/kustomization'] = 'kustomization.{yml,yaml}',
                                ['http://json.schemastore.org/ansible-playbook'] = '*play*.{yml,yaml}',
                                ['http://json.schemastore.org/chart'] = 'Chart.{yml,yaml}',
                                ['https://json.schemastore.org/dependabot-v2'] = '.github/dependabot.{yml,yaml}',
                                ['https://json.schemastore.org/gitlab-ci'] = '*gitlab-ci*.{yml,yaml}',
                                ['https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json'] = '*api*.{yml,yaml}',
                                ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '*docker-compose*.{yml,yaml}',
                                ['https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json'] = '*flow*.{yml,yaml}',
                            },
                            format = {
                                enable = true,
                                singleQuote = true,
                            },
                            yaml = {
                                validate = true,
                            },
                        },
                    },
                },

                stylelint_lsp = {
                    filetypes = {
                        'css',
                        'scss',
                        'less',
                        -- 'html',
                        -- 'angular.html',
                        -- "javascript",
                        -- "javascriptreact",
                        -- "typescript",
                        -- "typescriptreact",
                        -- 'vue',
                        'svelte',
                        -- "astro",
                    },
                    --root_dir = { ".git", ".stylelyntrc*" },
                    settings = {
                        stylelintplus = {
                            autoFixOnFormat = true,
                            autoFixOnSave = true,
                            validateOnType = true,
                            validateOnSave = true,
                        },
                    },
                },

                -- kotlin
                kotlin_language_server = {
                    root_dir = require('lspconfig').util.root_pattern(
                        'build.gradle.kts',
                        'build.gradle',
                        'pom.xml',
                        'settings.gradle.kts',
                        'settings.gradle',
                        '.git'
                    ),
                },

                vuels = {
                    root_dir = require('lspconfig').util.root_pattern(
                        'vue.config.js'
                    ),
                },
                volar = {
                    filetypes = {
                        'typescript',
                        'javascript',
                        'javascriptreact',
                        'typescriptreact',
                        'vue',
                        'json',
                    },
                    root_dir = require('lspconfig').util.root_pattern(
                        'vue.config.js'
                    ),
                    init_options = {
                        typescript = {
                            tsdk = vim.env.HOME
                                .. '/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
                        },
                    },
                },

                ltex = {
                    filetypes = { 'tex', 'latex', 'markdown', 'mdx' },
                },

                -- ##### We use neodev by folke #####
                lua_ls = {
                    -- cmd = {...},
                    -- filetypes { ...},
                    -- capabilities = {},
                    on_attach = function()
                        -- vim.lsp.inlay_hint.enable()
                    end,
                    settings = {
                        Lua = {
                            hint = {
                                enable = true,
                                arrayIndex = 'Enable',
                                setType = true,
                            },
                            runtime = { version = 'LuaJIT' },
                            workspace = {
                                checkThirdParty = false,
                                -- Tells lua_ls where to find all the Lua files that you have loaded
                                -- for your neovim configuration.
                                library = {
                                    '${3rd}/luv/library',
                                    unpack(
                                        vim.api.nvim_get_runtime_file('', true)
                                    ),
                                },
                                -- If lua_ls is really slow on your computer, you can try this instead:
                                -- library = { vim.env.VIMRUNTIME },
                            },
                            completion = {
                                callSnippet = 'Replace',
                            },
                            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                            -- diagnostics = { disable = { 'missing-fields' } },
                        },
                    },
                },
                angularls = {
                    filetypes = {
                        'typescript',
                        'javascript',
                        'html',
                        'astro',
                        'angular.html',
                    },
                    root_dir = require('lspconfig').util.root_pattern(
                        'angular.json',
                        'tsconfig.angular.json',
                        '.git'
                    ),
                },

                denols = {
                    single_file_support = false,
                    root_dir = require('lspconfig').util.root_pattern(
                        'deno.json',
                        'import_map.json'
                    ),
                },

                -- using plugin tailwind-tools
                tailwindcss = {
                    filetypes = {
                        'aspnetcorerazor',
                        'astro',
                        'astro-markdown',
                        'blade',
                        'clojure',
                        'django-html',
                        'htmldjango',
                        'edge',
                        'eelixir',
                        'elixir',
                        'ejs',
                        'erb',
                        'eruby',
                        'gohtml',
                        'gohtmltmpl',
                        'haml',
                        'handlebars',
                        'hbs',
                        'html',
                        -- 'html-eex',
                        'heex',
                        'jade',
                        'leaf',
                        'liquid',
                        'markdown',
                        'mdx',
                        'mustache',
                        'njk',
                        'nunjucks',
                        'php',
                        'razor',
                        'slim',
                        'twig',
                        'css',
                        'less',
                        'postcss',
                        'sass',
                        'scss',
                        'stylus',
                        'sugarss',
                        'javascript',
                        'javascriptreact',
                        'reason',
                        'rescript',
                        'typescript',
                        'typescriptreact',
                        'vue',
                        'svelte',
                        'templ',
                        'angular.html',
                    },
                    init_options = {
                        userLanguages = {
                            templ = 'html',
                            eelixir = 'html-eex',
                            eruby = 'erb',
                            ['angular.html'] = 'html',
                        },
                    },
                    settings = {
                        tailwindCSS = {
                            classAttributes = {
                                'class',
                                'className',
                                'class:list',
                                'classList',
                                'ngClass',
                                '.*class.*',
                                '.*Class.*',
                                '.*classes.*',
                                '.*Classes.*',
                                '.*className.*',
                                'ngClass',
                                '.*style.*',
                                '.*Style.*',
                                '.*styles.*',
                                '.*Styles.*',
                            },
                            experimental = {
                                classRegex = {
                                    "/\\* tw \\*/ '([^']*)",
                                    '/\\* tw \\*/ `([^`]*)',
                                    '/\\* tw \\*/ "([^"]*)',
                                    { '/\\* tw \\*/ {([^;]*);', "'([^']*)'" },
                                    { '/\\* tw \\*/ {([^;]*);', "`([^']*)`" },
                                    { '/\\* tw \\*/ {([^;]*);', '"([^"]*)"' },
                                    { '{# tw #} ([^}]*)}', "'([^']*)'" },
                                    { '{# tw #} ([^}]*)}', '"([^"]*)"' },
                                    { 'Classes \\=([^;]*);', "'([^']*)'" },
                                    { 'Classes \\=([^;]*);', '"([^"]*)"' },
                                    {
                                        'Classes \\=([^;]*);',
                                        '\\`([^\\`]*)\\`',
                                    },
                                    { 'Styles \\=([^;]*);', "'([^']*)'" },
                                    { 'Styles \\=([^;]*);', '"([^"]*)"' },
                                    {
                                        'Styles \\=([^;]*);',
                                        '\\`([^\\`]*)\\`',
                                    },
                                },
                            },

                            lint = {
                                cssConflict = 'warning',
                                invalidApply = 'error',
                                invalidConfigPath = 'error',
                                invalidScreen = 'error',
                                invalidTailwindDirective = 'error',
                                invalidVariant = 'error',
                                recommendedVariantOrder = 'warning',
                            },
                            validate = true,
                        },
                    },
                },
            }

            -- Ensure the servers and tools above are installed
            --  To check the current status of installed tools and/or manually install
            --  other tools, you can run
            --    :Mason
            --
            --  You can press `g?` for help in this menu
            require('mason').setup()

            -- You can add other tools here that you want Mason to install
            -- for you, so that they are available from within Neovim.

            local ensure_installed = vim.tbl_keys(servers or {})

            -- ##### Add other lsp for automatic installation and setup with default opts #####
            -- NOTE: no need to add them here if added to servers
            vim.list_extend(ensure_installed, {
                'stylua', -- Used to format lua code
                -- "google-java-format",
                -- "sumneko_lua",
                'grammarly',
                'bufls',
                'groovyls',
                'pylsp',
                'gradle_ls',
                'templ',
                'omnisharp',
                'svelte',
                'sonarlint-language-server',
                'rustywind',
                -- 'semgrep',
                'astro',
                'vimls',
                'ltex',
                'bashls',
                -- 'rust_analyzer',
                'rust-analyzer',
                'tsserver', -- using plugin typescript-tools?
                'pyright',
                'grammarly',
                'clangd',
                'prosemd_lsp',
                'dockerls',
                'dotls',
                'terraformls',
                -- 'emmet_ls',
                -- "go",
                'graphql',
                -- "java",
                -- "markdown",
                'marksman',
                -- "nginx",
                -- "openapi",
                'prismals',
                'prosemd_lsp',
                -- "scss",
                -- "scala",
                'solidity',
                'sqlls',
                -- 'typos_lsp',
                'autotools_ls',
                -- "vimscript",
                -- 'yamlls',
                -- "zsh"
                -- "java_language_server",
                -- 'jdtls', -- manual require it at the end, no autoinstall (java plugin)
            })

            require('mason-tool-installer').setup({
                ensure_installed = ensure_installed,
            })

            -- ##### Prevent those lsps to be automatically setup (but install them) #####
            -- in case you need one installed but need it inactive
            -- NOTE: lsps added here will not be automatically setup and started
            local skipped_automatic_setups = {
                tailwindcss = not _G.user.enable_tailwindcss, -- too laggy
                tsserver = true, -- using typescript-tools, not setting up
                rust_analyzer = true, -- using rustacean plugin, not setting up
                ['rust-analyzer'] = true, -- same as above
                sqlls = true, -- buggy as hell
                -- denols = true, -- deno-nvim plugin
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
