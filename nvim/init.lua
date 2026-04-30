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

-- Leader Keybinds
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>x', ':bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>u', function() vim.pack.update() end)
vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)

-- nvim tree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', { silent = true })

-- qol keybinds
vim.keymap.set({ 'n', 'v' }, '<C-/>', function()
    vim.cmd.norm('gcc')
end, { remap = true })
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', '<TAB>', '<C-y>')

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim' },
    { src = 'https://github.com/numToStr/Comment.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/sphamba/smear-cursor.nvim' },
    { src = gh('saghen/blink.cmp'),                        version = vim.version.range('<2.*') },
    { src = gh('brianhuster/live-preview.nvim') },
    { src = gh('windwp/nvim-autopairs') },
})

require('nvim-tree').setup()
require('Comment').setup()
require('smear_cursor').setup({})
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

vim.cmd('colorscheme catppuccin')

-- vim.cmd('hi statusline guibg=NONE')

-- LSP BRUHHHHH

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

vim.lsp.enable({ 'lua_ls', 'html', 'cssls', 'roslyn_ls', 'ts_ls' })
vim.diagnostic.config({ virtual_text = true })

-- Below text inline hints
-- vim.diagnostic.config({ virtual_lines = true })
