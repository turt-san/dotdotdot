return {
    'saghen/blink.cmp',
    lazy = false,
    priority = 500,
    opts = {
        keymap = {
            preset = 'default',
            ['<TAB>'] = { 'select_and_accept' },
        },
        completion = {
            menu = {
                enabled = true,
                max_height = 30,
                draw = {
                    gap = 2, -- spacing between columns
                    columns = {
                        { 'label', gap = 1 },
                        { 'kind' },
                        { 'label_description' },
                        -- { "source_name" },
                    },
                },
            },
            documentation = { auto_show = true },
            accept = { resolve_timeout_ms = 2000 },
        },
        sources = {
            providers = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                per_filetype = {
                    lua = { inherit_defaults = true, 'lazydev' },
                },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100, -- lazydev items rank first
                    },
                },
                path = {
                    opts = {
                        show_hidden_files_by_default = true,
                    },
                },
            },
        },
        -- fuzzy = {
        --     sorts = {
        --         -- Your custom sorting logic function goes here
        --         "score",
        --         "sort_text",
        --     },
        -- },
    },
    build = function()
        require('blink.cmp').build()
        -- :pwait()
    end,
}
