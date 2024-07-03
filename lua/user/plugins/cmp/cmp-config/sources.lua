local cmp_types = require('cmp.types')

local M = {}

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
            local kind = cmp_types.lsp.CompletionItemKind[entry:get_kind()]

            -- if kind == "Snippet" and (ctx.prev_context.filetype ~= "html" and ctx.prev_context.filetype ~= "svelte") then

            -- snippet is a huge noise in lsp, prefer luasnip and copilot
            -- but breaks emmet
            -- if
            --     kind == 'Snippet'
            --     -- and ctx.prev_context.filetype == 'java'
            -- then
            --     return false
            -- end

            -- NOTE: none-ls adds sources here. spell was adding noise

            -- text is a huge noise in lsp, prefer copilot and buffer source
            -- if
            --     kind == 'Text'
            --     -- and (
            --     --     ctx.prev_context.filetype ~= 'html'
            --     --     and ctx.prev_context.filetype ~= 'svelte'
            --     -- )
            -- then
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

local other_sources = {
    -- possible performance issues

    -- buffer sources, laggy
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
        option = {
            -- additional_arguments = '--smart-case --hidden -g "!.git" -g "!pnpm-lock.yaml" -g "!package-lock.json" -g "!node_modules" -g "!*cache',
            additional_arguments = '--smart-case',
        },
    },
}

local tooBig = function(bufnr)
    local max_filesize = 10 * 1024 -- 100 KB
    local check_stats = (vim.uv or vim.loop).fs_stat
    local ok, stats = pcall(check_stats, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and stats.size > max_filesize then
        return true
    else
        return false
    end
end

M.set_sources = function(ev, cmp)
    local sources = preferred_sources

    -- append buffer source if the file is not too big
    if _G.user.enable_text_search_in_cmp and not tooBig(ev.buf) then
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
end

return M
