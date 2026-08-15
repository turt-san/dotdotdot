vim.pack.add {
    { src = 'https://github.com/lopi-py/luau-lsp.nvim' }
}

-- Below text inline hints
-- vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
    'lua_ls',
    'html',
    'cssls',
    'roslyn_ls',
    'ts_ls',
    'pyright',
    'clangd',
    'rust_analyzer',
    'svelte',
    'pyright',
})

require("luau-lsp").setup({
    types = {
        definition_files = {
            ["@roblox"] = '/home/turt/Documents/Misc/globalTypes.d.luau'
        },
    },
    platform = {
        type = "roblox",
    },
    sourcemap = {
        enabled = true,
        autogenerate = true, -- automatic generation when the server is initialized
        rojo_project_file = "default.project.json",
        sourcemap_file = "sourcemap.json",
    },
    plugin = {
        enabled = true,
        port = 3667,
    },
    fflags = {
        enable_new_solver = true, -- enables the fflags required for luau's new type solver
        sync = true, -- sync currently enabled fflags with roblox's published fflags
        override = { -- override fflags passed to luau
            LuauTableTypeMaximumStringifierLength = "100",
        },
    },
})

-- vim.lsp.config('roslyn_ls', {
--     cmd = {
--         'dotnet',
--         '/home/turt/source/roslyn/lib/net10.0/Microsoft.CodeAnalysis.LanguageServer.dll',
--         '--logLevel', -- this property is required by the server
--         'Information',
--         '--extensionLogDirectory', -- this property is required by the server
--         vim.fs.joinpath(vim.uv.os_tmpdir(), 'roslyn_ls/logs'),
--         '--stdio',
--     },
-- })
