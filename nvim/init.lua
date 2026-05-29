-- help text-object-define
local vim = vim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'
vim.g.mapleader = ' '

local indent_width = 4
vim.opt.shiftwidth = indent_width
vim.opt.tabstop = indent_width
vim.opt.softtabstop = indent_width
vim.opt.expandtab = true
vim.opt.listchars = { trail = '', space = '·' }
vim.opt.fillchars = { eob = ' ' }
-- vim.opt.listchars = { space = '_', eol = '¬', tab = '<->', trail='·' }
-- print(' •·_¬')
vim.opt.list = true

-- Jump between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize windows
vim.keymap.set('n', '<C-Up>', '<C-w>-')
vim.keymap.set('n', '<C-Down>', '<C-w>+')

-- Leader QOL
vim.keymap.set('n', '<leader>o', '<CMD>update<CR><CMD>source<CR>')
vim.keymap.set('n', '<leader>w', '<CMD>write<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>quit<CR>')
vim.keymap.set('n', '<leader>x', '<CMD>bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>u', function() vim.pack.update() end)
vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>i', 'gg=G``zz')
vim.keymap.set('n', '<leader>h', '<CMD>let @/ = ""<CR>')
vim.keymap.set('n', '<leader>n', '<CMD>bn<CR>')

-- Leader Make
vim.keymap.set('n', '<leader>p', '<CMD>!python %<CR>')
vim.keymap.set('n', '<leader>c', '<CMD>!gcc -Wall -o out.c %<CR>')

-- QOL keybinds
vim.keymap.set({ 'n', 'v' }, '<C-_>', function()
    vim.cmd.norm('gcc')
end, { remap = true })
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<TAB>', '<C-y>')

-- Custom Functions
vim.api.nvim_create_user_command("EditVim", function ()
    vim.cmd('tabedit ~/.config/nvim/init.lua')
end, {})
-- Enter to enter an empty line below
vim.keymap.set('n', '<Enter>', function()
    if vim.v.count == 0 then
        vim.cmd.norm('o')
    end
    for i = 1, vim.v.count do
        vim.cmd.norm('o')
    end
end)

-- Enter to enter an empty line above
vim.keymap.set('n', '<S-Enter>', function()
    if vim.v.count == 0 then
        vim.cmd.norm('O')
    end
    for i = 1, vim.v.count do
        vim.cmd.norm('O')
    end
end)

-- test area
vim.keymap.set('n', '<C-z>', function()
    print(('penis'))
end)

-- nvim tree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', { silent = true })

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    { src = gh('catppuccin/nvim') },
    { src = gh('navarasu/onedark.nvim') },
    { src = gh('numToStr/Comment.nvim') },
    { src = gh('neovim/nvim-lspconfig') },
    { src = gh('nvim-tree/nvim-tree.lua') },
    -- { src = gh('sphamba/smear-cursor.nvim') },
    { src = gh('saghen/blink.cmp'), version = vim.version.range('<2.*') },
    { src = gh('brianhuster/live-preview.nvim') },
    { src = gh('windwp/nvim-autopairs') },
    { src = gh('kylechui/nvim-surround') },
    { src = gh('stevearc/oil.nvim') },
})

require('nvim-tree').setup()
require('oil').setup()
-- require('Comment').setup()
-- require('smear_cursor').setup({})
require('blink.cmp').setup({
    keymap = {
        preset = 'default',

        ['<TAB>'] = { 'select_and_accept' },
    },
    completion = {
        documentation = { auto_show = true }
    },
})
require('live-preview').setup()
require('nvim-autopairs').setup()
require('nvim-surround').setup()

--vim.cmd('colorscheme catppuccin')
require('onedark').setup({ style = 'darker' })
require('onedark').load()

-- LSP BRUHHHHH
vim.lsp.enable({ 'lua_ls', 'html', 'cssls', 'roslyn_ls', 'ts_ls', 'pyright', 'clangd' })
vim.diagnostic.config({ virtual_text = true })

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


        -- Below text inline hints
        -- vim.diagnostic.config({ virtual_lines = true })
