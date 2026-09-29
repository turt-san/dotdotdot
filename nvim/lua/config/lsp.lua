-- Below text inline hints
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<leader>gd", function()
    vim.diagnostic.open_float(0, { scope = "line" })
end)
vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
    -- { loclist = true }
end)

local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("svelte", {
    settings = {
        svelte = {
            plugin = {
                typescript = {
                    completeFunctionCalls = true,
                },
                javascript = {
                    completeFunctionCalls = true,
                },
            },
        },
    },
})

vim.lsp.config("qmlls", {
    cmd = { "/usr/lib/qt6/bin/qmlls", "-E" },
    cmd_env = {
        QML2_IMPORT_PATH = "/usr/lib/qt6/qml",
        QML_IMPORT_PATH = "/usr/lib/qt6/qml",
    },
    on_attach = function(client, bufnr)
        -- Target only this buffer when qmlls attaches
        vim.highlight.priorities.semantic_tokens = 95
    end,
})

vim.lsp.enable("qmlls")
