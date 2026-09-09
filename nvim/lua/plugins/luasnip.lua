return {
    "L3MON4D3/LuaSnip",
    lazy = false,
    config = function()
        local ls = require("luasnip")
        ls.setup({
            -- Tell LuaSnip to force update dynamic nodes immediately on text changes
            -- updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })
        require("luasnip").filetype_extend("typescript", { "javascript", "svelte" })

        vim.keymap.set({ "i" }, "<C-K>", function()
            ls.expand()
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function()
            ls.jump(1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function()
            ls.jump(-1)
        end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end,
    keys = {},
    build = "make install_jsregexp",
}
