return {
    "saghen/blink.cmp",
    lazy = false,
    priority = 500,
    opts = {
        keymap = {
            preset = "default",
            ["<TAB>"] = { "select_and_accept" },
        },
        completion = {
            enabled = true,
            max_height = 30,
            menu = {
                draw = {
                    gap = 2, -- spacing between columns
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind" },
                        { "label_description" },
                        { "source_name" },
                    },
                },
            },
            documentation = { auto_show = true },
            accept = { resolve_timeout_ms = 2000 },
        },
        sources = {
            providers = {
                path = {
                    opts = {
                        show_hidden_files_by_default = true,
                    },
                },
            },
        },
    },
    build = function()
        require("blink.cmp").build():pwait()
    end,
}
