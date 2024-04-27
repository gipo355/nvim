-- TODO: fix autocompletion and suggestions showed
--
-- NOTE: tldr mappings

-- TODO: buffer performance check [https://github.com/mars90226/dotvim/blob/master/lua/vimrc/plugins/nvim_cmp.lua#l71-l78]
-- [https://github.com/NStefan002/nvim_config/blob/main/lua/plugins/lsp.lua#L55]

-- took inspiration from https://github.com/MariaSolOs/dotfiles/blob/ea6bc00cb2b8571143f26f17c5370c738a852c7f/.config/nvim/lua/plugins/nvim-cmp.lua

-- c-l: accept copilot
-- c-y accept suggestion

-- c-o and c-space: open cmp

-- alt-l and alt-h: jumpable snippets

-- c-n and c-j: next
-- c-p and c-k: previous
-- a-n: next copilot
-- a-p: previous copilot

-- c-d and c-f: scroll docs

return {

    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {

            { 'luckasRanarison/tailwind-tools.nvim' },
            {
                'lukas-reineke/cmp-rg',
                enabled = _G.user.enable_rg_intellisense_in_cmp,
            },
            -- Snippet Engine & its associated nvim-cmp source
            {
                'Saecki/crates.nvim',
                event = 'BufRead Cargo.toml',
                config = true,
            },
            { 'onsails/lspkind.nvim' },
            { 'zbirenbaum/copilot.lua' }, -- config in its own file
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments
                    -- Remove the below condition to re-enable on windows
                    if
                        vim.fn.has('win32') == 1
                        or vim.fn.executable('make') == 0
                    then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),

                dependencies = {
                    'rafamadriz/friendly-snippets',
                },
            },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-path' },
            {
                'hrsh7th/cmp-buffer',
                enabled = _G.user.enable_buffer_intellisense_in_cmp,
            },

            -- If you want to add a bunch of pre-configured snippets,
            --    you can use this plugin to help you. It even has snippets
            --    for various frameworks/libraries/etc. but you will have to
            --    set up the ones that are useful for you.
            -- 'rafamadriz/friendly-snippets',
        },
        config = function()
            -- TODO: fix accept solution
            -- See `:help cmp`
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            local _, lspkind = pcall(require, 'lspkind')

            local utils = require('user.utils.functions')
            local paths = {}
            -- TODO: do they have any problems?
            paths[#paths + 1] = utils.join_paths(
                utils.get_runtime_dir(),
                'site',
                'pack',
                'lazy',
                'opt',
                'friendly-snippets'
            )
            local user_snippets = utils.join_paths(
                utils.get_config_dir(),
                'lua',
                'user',
                'snippets'
            )
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

            -- Inside a snippet, use backspace to remove the placeholder.
            vim.keymap.set('s', '<BS>', '<C-O>s', {
                silent = true,
                desc = 'Remove placeholder inside snippet',
            })

            local types = require('luasnip.util.types')
            -- `/` cmdline setup.
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline({
                    ['<Down>'] = {
                        c = cmp.mapping.select_next_item({
                            behavior = cmp.SelectBehavior.Insert,
                        }),
                    },
                    ['<Up>'] = {
                        c = cmp.mapping.select_prev_item({
                            behavior = cmp.SelectBehavior.Insert,
                        }),
                    },
                }),
                sources = {
                    { name = 'buffer' },
                },
                -- Display a cursor-like placeholder in unvisited nodes
                -- of the snippet.
                ext_opts = {
                    [types.insertNode] = {
                        unvisited = {
                            virt_text = { { '|', 'Conceal' } },
                            virt_text_pos = 'inline',
                        },
                    },
                },
            })

            -- `:` cmdline setup.
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline({
                    ['<Down>'] = {
                        c = cmp.mapping.select_next_item({
                            behavior = cmp.SelectBehavior.Insert,
                        }),
                    },
                    ['<Up>'] = {
                        c = cmp.mapping.select_prev_item({
                            behavior = cmp.SelectBehavior.Insert,
                        }),
                    },
                }),
                sources = cmp.config.sources({
                    { name = 'path' },
                }, {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' },
                        },
                    },
                }),
            })

            local status_cmp_ok, cmp_types_cmp = pcall(require, 'cmp.types.cmp')
            local ConfirmBehavior = cmp_types_cmp.ConfirmBehavior
            local SelectBehavior = cmp_types_cmp.SelectBehavior
            local cmp_window = require('cmp.config.window')
            local icons = require('user.utils.icons')
            local cmputils = require('user.plugins.cmp.utils.lsp-kind')
            local cmp_types = require('cmp.types')

            local tailwind_tools = require('tailwind-tools.cmp')

            local function prepare_completion_with_delay_opt()
                local opts = {
                    completeopt = 'menu,menuone,noinsert',
                }
                if _G.user.enable_autocomplete_delay then
                    opts.autocomplete = false
                end
                return opts
            end

            -- Those are sources that will always be on
            local preferred_sources = {

                {
                    name = 'html-css', -- plugin
                    option = {
                        enable_on = {
                            'html',
                            -- 'css',
                            -- 'scss',
                            'angular.html',
                        },
                        file_extensions = {
                            'html',
                            'css',
                            'scss',
                            'angular.html',
                        },
                        style_sheets = {
                            -- example of remote styles, only css no js for now
                            -- "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
                            -- "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
                            'https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css',
                            -- 'https://cdn.tailwindcss.com',
                            -- 'https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css',
                        },
                    },
                    keyword_length = 2,
                    max_item_count = 10,
                },

                {
                    name = 'luasnip',
                    keyword_length = 2,
                    max_item_count = 5,
                },

                -- ai, requires copilot.lua plugin, prefer ghost text
                -- {
                --     name = 'copilot',
                --     keyword_length = 1,
                --     max_item_count = 3,
                --     trigger_characters = {
                --         {
                --             '.',
                --             ':',
                --             '(',
                --             "'",
                --             '"',
                --             '[',
                --             ',',
                --             '#',
                --             '*',
                --             '@',
                --             '|',
                --             '=',
                --             '-',
                --             '{',
                --             '/',
                --             '\\',
                --             '+',
                --             '?',
                --             ' ',
                --             -- "\t",
                --             -- "\n",
                --         },
                --     },
                --     -- group_index = 2
                -- },

                -- filter out snippets and text, huge noise from real lsp suggestions
                {
                    name = 'git',
                    keyword_length = 2,
                    max_item_count = 5,
                },

                -- lsp
                {
                    name = 'nvim_lsp',
                    keyword_lengths = 2,
                    max_item_count = 50,

                    -- filter out snippets and text, huge noise from real lsp suggestions
                    entry_filter = function(entry, ctx)
                        local kind =
                            cmp_types.lsp.CompletionItemKind[entry:get_kind()]
                        -- if kind == "Snippet" and (ctx.prev_context.filetype ~= "html" and ctx.prev_context.filetype ~= "svelte") then
                        if
                            kind == 'Snippet'
                            and ctx.prev_context.filetype == 'java'
                        then
                            return false
                        end
                        -- if kind == 'Snippet' then
                        --     return false
                        -- end
                        -- if kind == "Text" and (ctx.prev_context.filetype ~= "html" and ctx.prev_context.filetype ~= "svelte") then
                        --     return false
                        -- end
                        return true
                    end,
                },

                {
                    name = 'path',
                    keyword_length = 2,
                    max_item_count = 5,
                },

                {
                    name = 'nvim_lua',
                    keyword_length = 2,
                    max_item_count = 5,
                },

                {
                    name = 'calc',
                    keyword_length = 3,
                    max_item_count = 5,
                },

                {
                    name = 'emoji',
                    keyword_length = 2,
                    max_item_count = 50,
                },

                {
                    name = 'treesitter',
                    keyword_length = 3,
                    max_item_count = 5,
                },

                {
                    name = 'crates',
                    keyword_length = 3,
                    max_item_count = 5,
                },

                {
                    name = 'tmux',
                    keyword_length = 3,
                    max_item_count = 5,
                },

                -- AI
                -- must enable plugins and setups
                -- { name = 'cmp_ai' },
                -- {
                --     name = 'cmp_tabnine',
                --     keyword_length = 3,
                --     max_item_count = 5,
                -- },
                -- {
                --     name = 'codeium',
                --     keyword_length = 3,
                --     max_item_count = 5,
                -- },
            }

            -- sources to not be loaded when the file is too big
            local other_sources = {
                -- possible performance issues
                {
                    name = 'buffer',
                    keyword_length = 2,
                    max_item_count = 5,
                },
                {
                    name = 'rg',
                    -- Try it when you feel cmp performance is poor
                    keyword_length = 2,
                    max_item_count = 5,
                },
            }

            -- check if the file is too big to enable some sources
            local function tooBig(bufnr)
                local max_filesize = 10 * 1024 -- 100 KB
                local check_stats = (vim.uv or vim.loop).fs_stat
                local ok, stats =
                    pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
                if ok and stats and stats.size > max_filesize then
                    return true
                else
                    return false
                end
            end

            -- set the sources
            vim.api.nvim_create_autocmd('BufReadPre', {
                group = vim.api.nvim_create_augroup(
                    'CmpBufferDisableGrp',
                    { clear = true }
                ),
                callback = function(ev)
                    local sources = preferred_sources

                    -- append buffer source if the file is not too big
                    if not tooBig(ev.buf) then
                        -- sources[#sources + 1] = {
                        --     name = 'buffer',
                        --     keyword_length = 2,
                        --     max_item_count = 5,
                        -- }
                        sources = vim.list_extend(sources, other_sources)
                    end

                    -- set the sources
                    cmp.setup.buffer({
                        sources = cmp.config.sources(sources),
                    })
                end,
            })

            cmp.setup({
                -- view = {
                --     entries = 'native', -- show native LSP entries
                -- },
                performance = {
                    debounce = 150, -- 150ms, interval to group up sources
                    throttle = 150, -- 150ms, delay filtering and displaying completions
                    max_view_entries = 150,
                    max_item_count = 150,
                },
                -- Disable preselect. On enter, the first thing will be used if nothing
                -- is selected.
                preselect = cmp.PreselectMode.None,
                -- conflicts with copilot?
                experimental = {
                    ghost_text = false,
                },
                confirm_opts = {
                    behavior = ConfirmBehavior.Replace,
                    select = true,
                },

                enabled = function()
                    -- local buftype = vim.api.nvim_buf_get_option(0, 'buftype') -- deprecated
                    local buftype = vim.bo.buftype
                    if buftype == 'prompt' then
                        return false
                    end
                    return true
                end,

                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol_text', -- show only symbol annotations
                        -- mode = 'symbol', -- show only symbol annotations
                        menu = {
                            buffer = '[Buffer]',
                            nvim_lsp = '[LSP]',
                            copilot = '[Copilot]',
                            git = '[Git]',
                            luasnip = '[LuaSnip]',
                            path = '[Path]',
                            cmp_tabnine = '[TabNine]',
                            calc = '[Calc]',
                            emoji = '[Emoji]',
                            treesitter = '[Treesitter]',
                            crates = '[Crates]',
                            tmux = '[Tmux]',
                            Codeium = '',
                            rg = '[Rg]',
                            nvim_lua = '[Lua]',
                            latex_symbols = '[Latex]',
                        },
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                        show_labelDetails = false,

                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

                        -- format for tailwind lspkind, things that can change tailwind formatting: tailwind-tools, tailwindcss-colorizer-cmp, highlight-colors
                        -- from reddit to include tailwind
                        -- enable THIS before to use other formatters
                        -- before = require('tailwind-tools.cmp').lspkind_format,
                        before = function(entry, vim_item)
                            if
                                _G.user.enable_css_intellisense_in_html
                                and entry.source.name == 'html-css'
                            then
                                vim_item.menu = entry.completion_item.menu
                                -- return vim_item
                            end

                            -- NOT this, old own method
                            -- vim_item =
                            --     cmputils.formatForTailwindCSS(entry, vim_item)

                            -- vim_item =
                            --     require('tailwindcss-colorizer-cmp').formatter(
                            --         entry,
                            --         vim_item
                            --     )

                            if _G.user.enable_tailwindcss then
                                vim_item = tailwind_tools.lspkind_format(
                                    entry,
                                    vim_item
                                )
                            end

                            return vim_item
                        end,
                    }),
                    fields = { 'kind', 'abbr', 'menu' },
                    max_width = 0,
                    kind_icons = icons.kind,
                    source_names = {
                        nvim_lsp = '(LSP)',
                        emoji = '(Emoji)',
                        path = '(Path)',
                        calc = '(Calc)',
                        cmp_tabnine = '(Tabnine)',
                        vsnip = '(Snippet)',
                        luasnip = '(Snippet)',
                        buffer = '(Buffer)',
                        tmux = '(TMUX)',
                        copilot = '(Copilot)',
                        treesitter = '(TreeSitter)',
                        codeium = '(Codeium)',
                        -- cmp_ai = '(Ollama)',
                    },
                    duplicates = {
                        buffer = 1,
                        path = 1,
                        nvim_lsp = 0,
                        luasnip = 1,
                    },
                    duplicates_default = 0,
                },

                -- show rounded border in completion menu
                window = {
                    -- completion = cmp_window.bordered(),
                    completion = {
                        border = 'single',
                        -- winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
                        -- winhighlight = cmp_window.bordered().winhighlight,
                    },
                    documentation = {
                        border = 'single',
                        -- winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
                        -- winhighlight = cmp_window.bordered().winhighlight,
                    },
                },

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                completion = prepare_completion_with_delay_opt(),

                -- For an understanding of why these mappings were
                -- chosen, you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                mapping = cmp.mapping.preset.insert({
                    -- BUG: c-n, c-p, c-k, c-j not working well in html

                    -- Select the [n]ext item
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    -- Select the [p]revious item
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-k>'] = cmp.mapping(
                        cmp.mapping.select_prev_item(),
                        { 'i', 'c' }
                    ),
                    ['<C-j>'] = cmp.mapping(
                        cmp.mapping.select_next_item(),
                        { 'i', 'c' }
                    ),

                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),

                    -- Accept ([y]es) the completion.
                    --  This will auto-import if your LSP supports it.
                    --  This will expand snippets if the LSP sent a snippet.
                    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),

                    -- ### lunarvim
                    -- accept
                    -- c-i doesn't work in command line because c-y is used in ins-mappings
                    ['<C-i>'] = cmp.mapping({
                        i = cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = false,
                        }),
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({
                                    behavior = cmp.ConfirmBehavior.Replace,
                                    select = false,
                                })
                            else
                                fallback()
                            end
                        end,
                    }),
                    ['<C-y>'] = cmp.mapping({
                        i = cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = false,
                        }),
                        c = function(fallback)
                            if cmp.visible() then
                                cmp.confirm({
                                    behavior = cmp.ConfirmBehavior.Replace,
                                    select = false,
                                })
                            else
                                fallback()
                            end
                        end,
                    }),
                    -- accept if visible otherwise open
                    -- not working, must set up below with only mapping
                    -- OLD
                    -- ['<C-o>'] = cmp.mapping({
                    --     -- i = cmp.mapping.confirm({
                    --     --     behavior = cmp.ConfirmBehavior.Replace,
                    --     --     select = false,
                    --     -- }),
                    --     c = function(fallback)
                    --         if cmp.visible() then
                    --             cmp.confirm({
                    --                 behavior = cmp.ConfirmBehavior.Replace,
                    --                 select = false,
                    --             })
                    --         else
                    --             fallback()
                    --         end
                    --     end,
                    -- }),
                    --
                    -- TRIED not working
                    -- ['<C-o>'] = cmp.mapping({
                    --     -- i = cmp.mapping.confirm({
                    --     --     behavior = cmp.ConfirmBehavior.Replace,
                    --     --     select = false,
                    --     -- }),
                    --     i = function(fallback)
                    --         if cmp.visible() then
                    --             -- cmp.mapping.confirm({
                    --             --     behavior = cmp.ConfirmBehavior.Replace,
                    --             --     select = false,
                    --             -- })
                    --
                    --             cmp.mapping.complete({})
                    --             cmp.confirm({
                    --                 behavior = cmp.ConfirmBehavior.Replace,
                    --                 select = false,
                    --             })
                    --         elseif not cmp.visible() then
                    --             cmp.mapping.complete({})
                    --             -- fallback()
                    --         else
                    --             fallback()
                    --         end
                    --     end,
                    --     c = function(fallback)
                    --         if cmp.visible() then
                    --             -- cmp.mapping.confirm({
                    --             --     behavior = cmp.ConfirmBehavior.Replace,
                    --             --     select = false,
                    --             -- })
                    --             cmp.mapping.complete({})
                    --             cmp.confirm({
                    --                 behavior = cmp.ConfirmBehavior.Replace,
                    --                 select = false,
                    --             })
                    --         elseif not cmp.visible() then
                    --             cmp.mapping.complete({})
                    --         else
                    --             fallback()
                    --         end
                    --     end,
                    -- }),
                    ['<C-o>'] = cmp.mapping.complete(), -- this works

                    -- ### change tab and enter behaviour for smoother completions

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        elseif cmputils.jumpable(1) then
                            luasnip.jump(1)
                        elseif cmp.visible() then
                            -- cmp.select_next_item()
                            local confirm_opts = vim.deepcopy({
                                behavior = ConfirmBehavior.Replace,
                                select = false,
                            }) -- avoid mutating the original opts below
                            local is_insert_mode = function()
                                return vim.api.nvim_get_mode().mode:sub(1, 1)
                                    == 'i'
                            end
                            if is_insert_mode() then -- prevent overwriting brackets
                                confirm_opts.behavior =
                                    cmp.ConfirmBehavior.Insert
                            end
                            if cmp.confirm(confirm_opts) then
                                return -- success, exit early
                            end
                        elseif cmputils.has_words_before() then
                            cmp.complete()
                        -- fallback()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        elseif cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    ['<C-e>'] = cmp.mapping.abort(),

                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local confirm_opts = vim.deepcopy({
                                behavior = ConfirmBehavior.Replace,
                                select = false,
                            }) -- avoid mutating the original opts below
                            local is_insert_mode = function()
                                return vim.api.nvim_get_mode().mode:sub(1, 1)
                                    == 'i'
                            end
                            if is_insert_mode() then -- prevent overwriting brackets
                                confirm_opts.behavior =
                                    cmp.ConfirmBehavior.Insert
                            end
                            if cmp.confirm(confirm_opts) then
                                return -- success, exit early
                            end
                        end

                        -- ## remove enter from blocking new line when in jumpable snippets
                        -- if jumpable(1) and luasnip.jump(1) then
                        --     return -- success, exit early
                        -- end
                        fallback() -- if not exited early, always fallback
                    end),

                    -- ## end lunarvim

                    -- Manually trigger a completion from nvim-cmp.
                    --  Generally you don't need this, because nvim-cmp will display
                    --  completions whenever it has completion options available.
                    ['<C-Space>'] = cmp.mapping.complete({}),

                    -- Think of <c-l> as moving to the right of your snippet expansion.
                    --  So if you have a snippet that's like:
                    --  function $name($args)
                    --    $body
                    --  end
                    --

                    -- CHANGED FOR COPILOT (c-l is used for accept)
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ['<M-l>'] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { 'i', 's' }),

                    ['<M-h>'] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { 'i', 's' }),
                }),

                sources = cmp.config.sources(),
            })

            -- set delay on autocompletion
            -- requires autocomplete = false
            if _G.user.enable_autocomplete_delay then
                local completionDelay = _G.user.autocomplete_delay
                local timer = nil

                -- So you can change the delay with:
                -- :lua setAutoCompleteDelay(300)
                function _G.setAutoCompleteDelay(delay)
                    completionDelay = delay
                end

                function _G.getAutoCompleteDelay()
                    return completionDelay
                end

                vim.api.nvim_create_autocmd(
                    { 'TextChangedI', 'CmdlineChanged' },
                    {
                        pattern = '*',
                        callback = function()
                            if timer then
                                vim.loop.timer_stop(timer)
                                timer = nil
                            end

                            timer = vim.loop.new_timer()
                            if not timer then
                                return
                            end
                            timer:start(
                                _G.getAutoCompleteDelay(),
                                0,
                                vim.schedule_wrap(function()
                                    cmp.complete({
                                        reason = cmp.ContextReason.Auto,
                                    })
                                end)
                            )
                        end,
                    }
                )
            end
            -- end of set delay on autocompletion

            -- BUG: codeium currently bugged in nvim-cmp
            -- must enable codeium plugin and source above
            -- local codeium_ok, codeium = pcall(require, 'codeium')
            -- if codeium_ok then
            --     codeium.setup({
            --         enable_chat = true,
            --     })
            -- end
        end,
    },

    {
        'Jezda1337/nvim-html-css',
        event = 'BufRead *.html',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-lua/plenary.nvim',
        },
        enabled = _G.user.enable_css_intellisense_in_html,
        config = function()
            require('html-css'):setup()
        end,
    },
}
