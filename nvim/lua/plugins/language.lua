return {
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
    {
        "jiangmiao/auto-pairs",
        lazy = false,
        config = function() end,
    },
    {
        "kylechui/nvim-surround",
        lazy = false,
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "prettierd",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        lazy = false,
        config = function()
            require("lint").linters_by_ft = {
                python = { "ruff" },
                typescript = { "eslint_d" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "saghen/blink.cmp",
        lazy = false,
        priority = 500,
        opts = {
            keymap = {
                preset = "default",
                ["<TAB>"] = { "select_and_accept" },
            },
            completion = {
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
    },
    {
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
    },
    {
        "stevearc/conform.nvim",
        config = function()
            local prettier = { "prettierd", "prettier", stop_after_first = true }
            require("conform").setup({
                formatters_by_ft = {
                    javascript = prettier,
                    typescript = prettier,
                    css = prettier,
                    lua = { "stylua" },
                    python = { "black" },
                    go = { "gofmt" },
                },
                formatters = {
                    prettierd = {
                        env = {
                            PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath("config") .. "/prettier-defaults.json",
                        },
                    },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true, -- falls back to vim.lsp.buf.format if no conform formatter defined
                },
            })
        end,
    },
}
-- cmdline = {
--     enabled = true,
--     sources = function()
--         local type = vim.fn.getcmdtype()
--         -- Search forward and backward (/ and ?)
--         if type == '/' or type == '?' then return { 'buffer' } end
--         -- Commands (:)
--         if type == ':' then return { 'cmdline', 'path' } end
--         return {}
--     end
-- }
