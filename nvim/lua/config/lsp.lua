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
