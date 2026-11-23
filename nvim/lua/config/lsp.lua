-- Below text inline hints
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })
vim.lsp.inlay_hint.enable(true)

-- { loclist = true }

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- print(vim.inspect(vim.lsp.get_clients({ name = "lua_ls" })[1].server_capabilities.documentFormattingProvider))
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' }, -- Neovim embeds LuaJIT
            diagnostics = {
                disable = { 'unused-function' },
            },
            format = {
                enable = false,
            },
        },
    },
    on_attach = function(client, bufnr)
        -- This physically strips the formatting feature out of the server's memory
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

vim.lsp.config('svelte', {
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

vim.lsp.config('qmlls', {
    cmd = { '/usr/lib/qt6/bin/qmlls', '-E' },
    cmd_env = {
        QML2_IMPORT_PATH = '/usr/lib/qt6/qml',
        QML_IMPORT_PATH = '/usr/lib/qt6/qml',
    },
    on_attach = function(client, bufnr)
        -- Target only this buffer when qmlls attaches
        vim.highlight.priorities.semantic_tokens = 95
    end,
})

vim.lsp.enable('qmlls')

vim.lsp.config('qmlls', {
    settings = {
        ['rust-analyzer'] = {
            inlayHints = {
                bindingModeHints = { enable = true }, -- shows hidden & / ref in patterns
                closureCaptureHints = { enable = true }, -- shows what closures capture, and how
                expressionAdjustmentHints = { enable = 'always' }, -- shows implicit & / * / deref adjustments
            },
        },
    },
})

vim.filetype.add({
    extension = {
        reds = 'redscript',
        script = 'redmod',
    },
})

vim.treesitter.language.register('swift', { 'redscript', 'redmod' })

-- vim.api.nvim_create_autocmd('FileType', {
--     group = vim.api.nvim_create_augroup('RedscriptSyntax', { clear = true }),
--     pattern = 'redscript',
--     callback = function(args)
--         vim.bo[args.buf].syntax = 'swift'
--     end,
-- })

vim.lsp.config('redscript_ide', {
    cmd = { '/home/turt/.local/bin/redscript-ide-x86_64-unknown-linux-gnu' },
    filetypes = { 'redscript', 'redmod' },
    root_markers = { '.redscript', '.git' },
    init_options = {
        game_dir = '/home/turt/.local/share/Steam/steamapps/common/Cyberpunk 2077',
    },
})

vim.lsp.enable('redscript_ide')
