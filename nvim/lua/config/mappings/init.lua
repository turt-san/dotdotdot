-- Jump between windows (numbered)
-- vim.keymap.set('n', '<leader>1', '1<C-w>w')
-- vim.keymap.set('n', '<leader>2', '2<C-w>w')
-- vim.keymap.set('n', '<leader>3', '3<C-w>w')
-- Jump between buffers
local function jump_to_nth_buffer(n)
    local all = vim.api.nvim_list_bufs()
    local real = {}
    for _, bufnr in ipairs(all) do
        if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then table.insert(real, bufnr) end
    end
    n = math.min(n, #real)
    if real[n] then vim.api.nvim_set_current_buf(real[n]) end
end

for i = 1, 10 do
    i = i % 10
    vim.keymap.set('n', '<leader>' .. i, function()
        jump_to_nth_buffer(i)
    end, { desc = 'Go to buffer ' .. i })
end

-- use :map to see bindings
-- Jump between windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resize windows
vim.keymap.set('n', '<C-Up>', '<C-w>-')
vim.keymap.set('n', '<C-Down>', '<C-w>+')

-- Leader QOL
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>')
vim.keymap.set('n', '<leader>q', '<Cmd>quit<CR>')
vim.keymap.set('n', '<leader>r', '<Cmd>lsp restart<CR>')
vim.keymap.set('n', '<leader>x', '<Cmd>bprevious | bdelete #<CR>', { silent = true })
vim.keymap.set('n', '<leader>u', '<Cmd>Lazy sync<CR>')
vim.keymap.set('n', '<leader>ii', 'gg=G``')
vim.keymap.set('n', '<leader>h', '<Cmd>let @/ = ""<CR>')
vim.keymap.set('n', '<leader>n', '<Cmd>bn<CR>')
vim.keymap.set('n', '<leader>yf', '<Cmd>1,$y+"<CR>', { desc = 'Yank entire file into clipboard' })
vim.keymap.set('n', '<leader>d', 'dd', { silent = true })
vim.keymap.set('n', '<leader>y', 'yy', { silent = true })
vim.keymap.set('n', '<leader>O', '<Cmd>update<CR><Cmd>source<CR>')

-- QOL keybinds
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<M-CR>', 'O<Esc>')
local commentcmd = '<Cmd>execute "norm" v:count .. "gcc"<CR>'
vim.keymap.set({ 'n', 'v' }, '<C-/>', commentcmd)
vim.keymap.set({ 'n', 'v' }, '<C-_>', commentcmd)
vim.keymap.set('i', 'jk', '<Esc>')
-- vim.keymap.set('i', '<TAB>', '<C-y>')
-- vim.keymap.set('n', '/', '/\\v', { desc = 'very magic search' })
-- vim.keymap.set('n', '?', '?\\v', { desc = 'very magic backward search' })
-- vim.keymap.set('v', ':s/', ':s/\\v', { desc = 'substitute very magically. dopely even.' })

vim.keymap.set('s', '<BS>', '<C-O>c', { silent = true, desc = 'Delete placeholder safely' })

-- PLUGINS
vim.keymap.set('n', '<leader>o', '<Cmd>Oil<CR>')

-- nvim tree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>', { silent = true })

-- LSP binds
require('config.mappings.lsp')
require('config.mappings.telescope')
