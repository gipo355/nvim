local status_cmp_ok, cmp_types_cmp = pcall(require, 'cmp.types.cmp')
local cmputils = require('user.plugins.cmp.utils.lsp-kind')
local ConfirmBehavior = cmp_types_cmp.ConfirmBehavior
local luasnip = require('luasnip')

-- For an understanding of why these mappings were
-- chosen, you will need to read `:help ins-completion`
--
-- No, but seriously. Please read `:help ins-completion`, it is really good!
--
local M = {}

M.setup = function(cmp)
    return {
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
                        return vim.api.nvim_get_mode().mode:sub(1, 1) == 'i'
                    end
                    if is_insert_mode() then -- prevent overwriting brackets
                        confirm_opts.behavior = cmp.ConfirmBehavior.Insert
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
                        return vim.api.nvim_get_mode().mode:sub(1, 1) == 'i'
                    end
                    if is_insert_mode() then -- prevent overwriting brackets
                        confirm_opts.behavior = cmp.ConfirmBehavior.Insert
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
    }
end
return M
