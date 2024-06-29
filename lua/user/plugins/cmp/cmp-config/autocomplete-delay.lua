local M = {}

M.setup_delay = function(cmp)
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

    vim.api.nvim_create_autocmd({ 'TextChangedI', 'CmdlineChanged' }, {
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
    })
end

return M
