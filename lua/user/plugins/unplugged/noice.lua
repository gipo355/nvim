return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    -- opts = {
    --     -- add any options here
    -- },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        'MunifTanjim/nui.nvim',
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- "rcarriga/nvim-notify",
    },

    config = function()
        local ok, noice = pcall(require, 'noice')

        if not ok then
            return
        end

        noice.setup({
            -- show macro recording message
            routes = {
                {
                    view = 'notify',
                    filter = { event = 'msg_showmode' },
                },
            },
            -- messages = {
            --     enabled = false
            -- },
            -- notify = {
            --     enabled = false
            -- },
            -- cmdline = {
            --     opts = {
            --         position = {
            --             row = "50%",
            --             col = "50%",
            --         },
            --     }
            -- },

            -- add any options here
            -- recommended
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                -- override = {
                --     ['vim.lsp.util.convert_input_to_markdown_lines'] = false,
                --     ['vim.lsp.util.stylize_markdown'] = false,
                --     ['cmp.entry.get_documentation'] = false,
                -- },
                progress = {
                    enabled = false,
                },
                message = {
                    enabled = false,
                },
                hover = {
                    enabled = false,
                },
                -- error fix
                signature = {
                    enabled = false,
                    -- auto_open = {
                    --     enabled = true,
                    -- },
                },
            },
            -- config.lsp.signature.enabled = false
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        })
    end,
}
