--[[
help text-object-define
to restart a buffer:
:bufdo e
--]]

require("options")
require("mappings")
require("plugins")
require("lsp")

-- vim.cmd("set keymap=dvorak")

-- custom tmux session support
local tmux = vim.env.Z_TMUX_CODE
if tmux ~= nil then
    vim.keymap.set('n', '<leader>p', '<Cmd>silent! make<CR>', { silent = true })
    vim.o.shellpipe = "2>&1|tmux display-message -t code:nvim.2 -I|tee"
    vim.o.makeef = ""
else
    vim.keymap.set('n', '<leader>p', '<Cmd>make<CR>', { silent = true })
end

local makeprg = {
    rust   = "cargo run -q",
    python = "python %",
    c      = "gcc -Wall -o out.c %",
}

-- autocmd that checks current file type and sets the makeprg accordingly
vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local lang = args.match
        if makeprg[lang] ~= nil then
            vim.o.makeprg = makeprg[lang]
        end
    end
})


-- Custom functions
vim.api.nvim_create_user_command("EditVim", function()
    vim.cmd('tabedit ~/.config/nvim/init.lua')
end, {})

-- PARSING BRUHHHHHHHHHHHHHH==========================================

local parsers = {
    'rust',
    'bash',
    'c',
    'python',
    'lua'
}

require('nvim-treesitter').install({ parsers })

-- STOLEN CODE
---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
    -- Check if a parser exists and load it
    if not vim.treesitter.language.add(language) then return end
    -- Enable syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- Enable treesitter based folds
    -- For more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- Check if treesitter indentation is available for this language, and if so enable it
    -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

    -- Enable treesitter based indentation
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

local available_parsers = require('nvim-treesitter').get_available()

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then return end

        local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

        if vim.tbl_contains(installed_parsers, language) then
            -- Enable the parser if it is already installed
            treesitter_try_attach(buf, language)
        elseif vim.tbl_contains(available_parsers, language) then
            -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
            require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
        else
            -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
        end
    end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--     callback = function(args)
--         for i, arg in pairs(args) do
--             print(i, arg)
--         end
--     end,
-- })

--[[
        LINTING YOOOOOOOOOO
        --]]

require('lint').linters_by_ft = {
    python = { 'ruff' },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
    callback = function()
        require('lint').try_lint()
    end
})

-- vim.cmd('hi statusline guibg=NONE')

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
