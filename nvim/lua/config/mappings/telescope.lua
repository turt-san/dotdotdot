local prefix = '+Telescope: '
local builtin = require('telescope.builtin')
local ivy = require('telescope.themes').get_ivy({ show_plug = false })

if true then print() end

vim.keymap.set(
    'n',
    '<leader>sk',
    function()
        builtin.keymaps(ivy)
    end,
    { desc = prefix .. 'Search Keymaps' }
)
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = prefix .. 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = prefix .. 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = prefix .. 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = prefix .. 'Telescope help tags' })
vim.keymap.set(
    'n',
    '<leader>iw',
    function()
        require('telescope.builtin').grep_string()
    end,
    { desc = prefix .. 'Search Current Word in Project' }
)
vim.keymap.set(
    'n',
    '<leader>fi',
    function()
        builtin.current_buffer_fuzzy_find(ivy)
    end,
    { desc = prefix .. 'Search in Current File' }
)
