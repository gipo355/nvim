return {
    {
        -- ### REPLASEMENT FOR tsserver
        -- must change: keybinds, automatic preinstall of tsserver, comment out nvim-lsp-ts-utils
        -- setup below
        'pmizio/typescript-tools.nvim',
        event = 'BufEnter',
        -- enabled = not _G.user.use_deno_disable_ts,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
            'davidosomething/format-ts-errors.nvim',
        },
        config = function()
            local ok, tstools = pcall(require, 'typescript-tools')

            if not ok then
                return
            end

            -- TODO: fix tsserver and deno

            tstools.setup({
                -- on_attach = function(client, bufnr)
                --     local capabilities = require("lvim.lsp").common_capabilities()
                -- vim.lsp.buf.inlay_hint(bufnr, true)

                -- vim.keymap.set({ "n", "x", "v" }, "<leader>va", vim.lsp.buf.code_action,
                -- { buffer = bufnr, desc = "Code Action" })

                -- vim.keymap.set({ "n", "v" }, "<leader>vA",
                --     '<cmd>vim.lsp.buf.code_action()<CR>',
                --     { buffer = bufnr, desc = "Code Action", noremap = true, silent = true })
                -- lvim.builtin.which_key.mappings.v.a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" }
                --     capabilities = capabilities
                -- end,
                -- on_attach = require("lvim.lsp").common_on_attach,

                -- for format-ts-errors.nvim
                single_file_support = false,
                root_dir = require('lspconfig').util.root_pattern(
                    'package.json',
                    'node_modules',
                    'jsconfig.json'
                ),
                on_attach = function(client, bufnr)
                    -- NOTE: prevent tsserver denols collision
                    -- if
                    --     require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")(
                    --         vim.fn.getcwd()
                    --     )
                    -- then
                    --     if client.name == "typescript-tools" then
                    --         client.stop()
                    --         return
                    --     end
                    -- end

                    -- commented last
                    local active_clients = vim.lsp.get_clients()

                    if client.name == 'denols' then
                        for _, client_ in pairs(active_clients) do
                            -- stop tsserver if denols is already active
                            if
                                client_.name == 'tsserver'
                                or client_.name == 'typescript-tools'
                            then
                                client_.stop()
                            end
                        end
                    elseif
                        client.name == 'typescript-tools'
                        or client.name == 'tsserver'
                    then
                        for _, client_ in pairs(active_clients) do
                            -- prevent tsserver from starting if denols is already active
                            if client_.name == 'denols' then
                                client.stop()
                            end
                        end
                    end
                    ----

                    vim.keymap.set(
                        { 'n', 'v' },
                        '<leader>va',
                        ':Lspsaga code_action<cr>',
                        { buffer = bufnr, desc = 'ts code actions' }
                    )
                    -- vim.lsp.inlay_hint.enable() -- uncomment to enable inlay hints for typescript
                    -- vim.lsp.codelens.refresh()
                    -- vim.diagnostic.disable()
                end,

                handlers = {
                    ['textDocument/publishDiagnostics'] = function(
                        _,
                        result,
                        ctx,
                        config
                    )
                        if result.diagnostics == nil then
                            return
                        end

                        -- ignore some tsserver diagnostics
                        local idx = 1
                        while idx <= #result.diagnostics do
                            local entry = result.diagnostics[idx]

                            local formatter =
                                require('format-ts-errors')[entry.code]
                            entry.message = formatter
                                    and formatter(entry.message)
                                or entry.message

                            -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
                            -- if entry.code == 80001 then
                            if false then
                                -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
                                table.remove(result.diagnostics, idx)
                            else
                                idx = idx + 1
                            end
                        end

                        vim.lsp.diagnostic.on_publish_diagnostics(
                            _,
                            result,
                            ctx,
                            config
                        )
                    end,
                    -- ['textDocument/definition'] = function(_, result, params)
                    --     local util = require('vim.lsp.util')
                    --     if result == nil or vim.tbl_isempty(result) then
                    --         -- local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
                    --         return nil
                    --     end
                    --
                    --     if vim.tbl_islist(result) then
                    --         -- this is opens a buffer to that result
                    --         -- you could loop the result and choose what you want
                    --         util.jump_to_location(result[1])
                    --
                    --         if #result > 1 then
                    --             local isReactDTs = false
                    --             ---@diagnostic disable-next-line: unused-local
                    --             for key, value in pairs(result) do
                    --                 if
                    --                     string.match(
                    --                         value.targetUri,
                    --                         'react/index.d.ts'
                    --                     )
                    --                 then
                    --                     isReactDTs = true
                    --                     break
                    --                 end
                    --             end
                    --             if not isReactDTs then
                    --                 -- this sets the value for the quickfix list
                    --                 util.set_qflist(
                    --                     util.locations_to_items(result)
                    --                 )
                    --                 -- this opens the quickfix window
                    --                 vim.api.nvim_command('copen')
                    --                 vim.api.nvim_command('wincmd p')
                    --             end
                    --         end
                    --     else
                    --         util.jump_to_location(result)
                    --     end
                    -- end,
                },
                settings = {
                    -- code_lens = 'all',
                    -- spawn additional tsserver instance to calculate diagnostics on it
                    separate_diagnostic_server = true,

                    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
                    publish_diagnostic_on = 'insert_leave',

                    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused")
                    -- specify commands exposed as code_actions
                    expose_as_code_action = {
                        'fix_all',
                        'add_missing_imports',
                        'remove_unused',
                    },

                    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
                    -- not exists then standard path resolution strategy is applied
                    -- tsserver_path = nil,

                    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
                    -- (see 💅 `styled-components` support section)
                    tsserver_plugins = {
                        -- for TypeScript v4.9+
                        '@styled/typescript-styled-plugin',
                        -- or for older TypeScript versions
                        -- "typescript-styled-plugin",
                    },

                    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
                    -- memory limit in megabytes or "auto"(basically no limit)
                    tsserver_max_memory = 'auto',

                    -- described below
                    -- tsserver_format_options = {
                    --     -- insertSpaceAfterCommaDelimiter?: boolean;
                    --     -- insertSpaceAfterSemicolonInForStatements?: boolean;
                    --     -- insertSpaceBeforeAndAfterBinaryOperators?: boolean;
                    --     -- insertSpaceAfterConstructor?: boolean;
                    --     -- insertSpaceAfterKeywordsInControlFlowStatements?: boolean;
                    --     -- insertSpaceAfterFunctionKeywordForAnonymousFunctions?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingEmptyBraces?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces?: boolean;
                    --     -- insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces?: boolean;
                    --     -- insertSpaceAfterTypeAssertion?: boolean;
                    --     -- insertSpaceBeforeFunctionParenthesis?: boolean;
                    --     -- placeOpenBraceOnNewLineForFunctions?: boolean;
                    --     -- placeOpenBraceOnNewLineForControlBlocks?: boolean;
                    --     -- insertSpaceBeforeTypeAnnotation?: boolean;
                    --     -- semicolons?: SemicolonPreference;
                    -- },

                    tsserver_file_preferences = {
                        --          disableSuggestions?: boolean;
                        --  quotePreference?: "auto" | "double" | "single";
                        -- /**
                        --  * If enabled, TypeScript will search through all external modules' exports and add them to the completions list.
                        --  * This affects lone identifier completions but not completions on the right hand side of `obj.`.
                        --  */
                        includeCompletionsForModuleExports = true,
                        -- /**
                        --  * Enables auto-import-style completions on partially-typed import statements. E.g., allows
                        --  * `import write|` to be completed to `import { writeFile } from "fs"`.
                        --  */
                        includeCompletionsForImportStatements = true,
                        -- /**
                        --  * Allows completions to be formatted with snippet text, indicated by `CompletionItem["isSnippet"]`.
                        --  */
                        includeCompletionsWithSnippetText = true,
                        -- /**
                        --  * If enabled, the completion list will include completions with invalid identifier names.
                        --  * For those entries, The `insertText` and `replacementSpan` properties will be set to change from `.x` property access to `["x"]`.
                        --  */
                        --  includeCompletionsWithInsertText?: boolean;
                        -- /**
                        --  * Unless this option is `false`, or `includeCompletionsWithInsertText` is not enabled,
                        --  * member completion lists triggered with `.` will include entries on potentially-null and potentially-undefined
                        --  * values, with insertion text to replace preceding `.` tokens with `?.`.
                        --  */
                        --  includeAutomaticOptionalChainCompletions?: boolean;
                        -- /**
                        --  * If enabled, completions for class members (e.g. methods and properties) will include
                        --  * a whole declaration for the member.
                        --  * E.g., `class A { f| }` could be completed to `class A { foo(): number {} }`, instead of
                        --  * `class A { foo }`.
                        --  */
                        --  includeCompletionsWithClassMemberSnippets?: boolean;
                        -- /**
                        --  * If enabled, object literal methods will have a method declaration completion entry in addition
                        --  * to the regular completion entry containing just the method name.
                        --  * E.g., `const objectLiteral: T = { f| }` could be completed to `const objectLiteral: T = { foo(): void {} }`,
                        --  * in addition to `const objectLiteral: T = { foo }`.
                        --  */
                        --  includeCompletionsWithObjectLiteralMethodSnippets?: boolean;
                        -- /**
                        --  * Indicates whether {@link CompletionEntry.labelDetails completion entry label details} are supported.
                        --  * If not, contents of `labelDetails` may be included in the {@link CompletionEntry.name} property.
                        --  */
                        --  useLabelDetailsInCompletionEntries?: boolean;
                        --  allowIncompleteCompletions?: boolean;
                        --  importModuleSpecifierPreference?: "shortest" | "project-relative" | "relative" | "non-relative";
                        -- /** Determines whether we import `foo/index.ts` as "foo", "foo/index", or "foo/index.js" */
                        --  importModuleSpecifierEnding?: "auto" | "minimal" | "index" | "js";
                        --  allowTextChangesInNewFiles?: boolean;
                        --  lazyConfiguredProjectsFromExternalProject?: boolean;
                        --  providePrefixAndSuffixTextForRename?: boolean;
                        --  provideRefactorNotApplicableReason?: boolean;
                        --  allowRenameOfImportPath?: boolean;
                        --  includePackageJsonAutoImports?: "auto" | "on" | "off";
                        --  jsxAttributeCompletionStyle?: "auto" | "braces" | "none";

                        --  displayPartsForJSDoc?: boolean;
                        --  generateReturnInDocTemplate?: boolean;

                        -- ##### FOR INLAY HINTS #####
                        includeInlayParameterNameHints = 'all', -- "none" | "literals" | "all";
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                        -- ####

                        --  autoImportFileExcludePatterns?: string[];
                        -- importModuleSpecifierPreference = 'non-relative'

                        -- /**
                        --  * Indicates whether imports should be organized in a case-insensitive manner.
                        --  */
                        --  organizeImportsIgnoreCase?: "auto" | boolean;
                        -- /**
                        --  * Indicates whether imports should be organized via an "ordinal" (binary) comparison using the numeric value
                        --  * of their code points, or via "unicode" collation (via the
                        --  * [Unicode Collation Algorithm](https://unicode.org/reports/tr10/#Scope)) using rules associated with the locale
                        --  * specified in {@link organizeImportsCollationLocale}.
                        --  *
                        --  * Default: `"ordinal"`.
                        --  */
                        --  organizeImportsCollation?: "ordinal" | "unicode";
                        -- /**
                        --  * Indicates the locale to use for "unicode" collation. If not specified, the locale `"en"` is used as an invariant
                        --  * for the sake of consistent sorting. Use `"auto"` to use the detected UI locale.
                        --  *
                        --  * This preference is ignored if {@link organizeImportsCollation} is not `"unicode"`.
                        --  *
                        --  * Default: `"en"`
                        --  */
                        --  organizeImportsCollationLocale?: string;
                        -- /**
                        --  * Indicates whether numeric collation should be used for digit sequences in strings. When `true`, will collate
                        --  * strings such that `a1z < a2z < a100z`. When `false`, will collate strings such that `a1z < a100z < a2z`.
                        --  *
                        --  * This preference is ignored if {@link organizeImportsCollation} is not `"unicode"`.
                        --  *
                        --  * Default: `false`
                        --  */
                        --  organizeImportsNumericCollation?: boolean;
                        -- /**
                        --  * Indicates whether accents and other diacritic marks are considered unequal for the purpose of collation. When
                        --  * `true`, characters with accents and other diacritics will be collated in the order defined by the locale specified
                        --  * in {@link organizeImportsCollationLocale}.
                        --  *
                        --  * This preference is ignored if {@link organizeImportsCollation} is not `"unicode"`.
                        --  *
                        --  * Default: `true`
                        --  */
                        --  organizeImportsAccentCollation?: boolean;
                        -- /**
                        --  * Indicates whether upper case or lower case should sort first. When `false`, the default order for the locale
                        --  * specified in {@link organizeImportsCollationLocale} is used.
                        --  *
                        --  * This preference is ignored if {@link organizeImportsCollation} is not `"unicode"`. This preference is also
                        --  * ignored if we are using case-insensitive sorting, which occurs when {@link organizeImportsIgnoreCase} is `true`,
                        --  * or if {@link organizeImportsIgnoreCase} is `"auto"` and the auto-detected case sensitivity is determined to be
                        --  * case-insensitive.
                        --  *
                        --  * Default: `false`
                        --  */
                        --  organizeImportsCaseFirst?: "upper" | "lower" | false;

                        -- /**
                        --  * Indicates whether {@link ReferencesResponseItem.lineText} is supported.
                        --  */
                        --  disableLineTextInReferences?: boolean;

                        -- includeInlayParameterNameHints = "all",
                        -- includeCompletionsForModuleExports = true,
                        -- quotePreference = "auto",
                    },

                    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
                    complete_function_calls = true,
                },
            })

            -- This plugin provides several custom user commands (they are only applied to current buffer):

            -- TSToolsOrganizeImports - sorts and removes unused imports
            -- TSToolsSortImports - sorts imports
            -- TSToolsRemoveUnusedImports - removes unused imports
            -- TSToolsRemoveUnused - removes all unused statements
            -- TSToolsAddMissingImports - adds imports for all statements that lack one and can be imported
            -- TSToolsFixAll - fixes all fixable errors
            -- TSToolsGoToSourceDefinition - goes to source definition (available since TS v4.7)
        end,
        -- opts = {},
    },
}
