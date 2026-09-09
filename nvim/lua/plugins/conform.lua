return {
    "stevearc/conform.nvim",
    config = function()
        local prettier = { "prettierd", "prettier", stop_after_first = true }
        require("conform").setup({
            log_level = vim.log.levels.DEBUG,
            formatters_by_ft = {
                javascript = prettier,
                typescript = prettier,
                css = prettier,
                lua = { "stylua" },
                python = { "black" },
                go = { "gofmt" },
                asm = { "asmfmt" },
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
}
