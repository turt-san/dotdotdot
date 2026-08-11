-- use :map to see bindings
-- Jump between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Jump between windows (numbered)
vim.keymap.set('n', '<leader>1', '1<C-w>w')
vim.keymap.set('n', '<leader>2', '2<C-w>w')
vim.keymap.set('n', '<leader>3', '3<C-w>w')

-- Resize windows
vim.keymap.set('n', '<C-Up>', '<C-w>-')
vim.keymap.set('n', '<C-Down>', '<C-w>+')

-- Leader QOL
vim.keymap.set('n', '<leader>o', '<Cmd>update<CR><Cmd>source<CR>')
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>quit<CR>')
vim.keymap.set('n', '<leader>x', '<Cmd>bdelete<CR>', { silent = true })
vim.keymap.set('n', '<leader>u', vim.pack.update)
vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>i', 'gg=G``zz')
vim.keymap.set('n', '<leader>h', '<Cmd>let @/ = ""<CR>')
vim.keymap.set('n', '<leader>n', '<Cmd>bn<CR>')
vim.keymap.set('n', '<leader>yy', '<Cmd>1,$y+\"<CR>')
vim.keymap.set('n', '<leader>d', 'dd', { silent = true })

-- QOL keybinds
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<M-CR>', 'O<Esc>')
local commentcmd = '<Cmd>execute "norm" v:count .. "gcc"<CR>'
vim.keymap.set({ 'n', 'v' }, '<C-/>', commentcmd)
vim.keymap.set({ 'n', 'v' }, '<C-_>', commentcmd)
vim.keymap.set('i', 'jk', '<Esc>')
-- vim.keymap.set('i', '<TAB>', '<C-y>')

-- nvim tree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', { silent = true })

-- LSP binds
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename)
