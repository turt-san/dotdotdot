local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>cd', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>gd', function()
    vim.diagnostic.open_float(0, { scope = 'line' })
end)

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Telescope Go to Definition' })
vim.keymap.set('n', '<leader>fu', builtin.lsp_references, { desc = 'Telescope Show References' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Telescope Go to Implementation' })
vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = 'Telescope Type Definition' })

vim.keymap.set('n', '<leader>dg', builtin.diagnostics, { desc = 'Telescope Document Diagnostics' })
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Telescope Document Symbols' })
vim.keymap.set('n', '<leader>sw', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope Workspace Symbols' })
