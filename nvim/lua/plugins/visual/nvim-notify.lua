return {
    'rcarriga/nvim-notify',
    lazy = false,
    priority = 1000,
    keys = {
        {
            '<leader>un',
            function()
                require('notify').dismiss({ silent = true, pending = true })
            end,
            desc = 'Dismiss All Notifications',
        },
    },
    opts = {
        background_colour = '#00000000',
        merge_duplicates = false,
        timeout = 3000,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        stages = 'fade_in_slide_out', -- Options: "fade", "slide", "fade_in_slide_out", "static"
        render = 'default', -- Options: "default", "minimal", "simple", "compact"
    },
    config = function(_, opts)
        local notify = require('notify')
        notify.setup(opts)
        vim.notify = notify -- Overwrite the default Neovim notify function
    end,
}
