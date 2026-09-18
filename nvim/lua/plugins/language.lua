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
                "black",
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
