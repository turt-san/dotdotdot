--[[
================================================================================
=============================   PLUGINS   =============================
================================================================================
--]]
-- vim.notify("PENIS", 3)
local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add({
    { src = gh 'nvim-tree/nvim-tree.lua' },
    { src = gh 'nvim-lua/plenary.nvim' },
    { src = gh 'nvim-telescope/telescope.nvim' },
    { src = gh 'stevearc/oil.nvim' },
    { src = gh 'brianhuster/live-preview.nvim' },
    { src = gh 'nvim-tree/nvim-web-devicons' },
    { src = gh 'nvim-lualine/lualine.nvim' },
    { src = gh 'nemanjamalesija/smart-paste.nvim' },
})

require('nvim-tree').setup()
require('oil').setup({
    view_options = {
        show_hidden = true,
    },
})
require('lualine').setup({
    sections = {
        lualine_c = { 'buffers' }
    }
})
require('smart-paste').setup()
require('live-preview').setup()
require('telescope').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- require("oil").setup({
--     default_file_explorer = true,
--     delete_to_trash = true,
--     skip_confirm_for_simple_edits = true,
--     view_options = {
--         show_hidden = true,
--         natural_order = true,
--         is_always_hidden = function(name, _)
--             return name == ".." or name == ".git"
--         end,
--     },
--     float = {
--         padding = 2,
--         max_width = 90,
--         max_height = 0,
--     },
--     win_options = {
--         wrap = true,
--         winblend = 0,
--     },
--     keymaps = {
--         ["<C-c>"] = false,
--         ["q"] = "actions.close",
--     },
-- })
--[[
=============================   VISUAL   =============================
--]]

vim.pack.add({
    { src = gh 'sphamba/smear-cursor.nvim' },
    { src = gh 'catppuccin/nvim' },
    { src = gh 'navarasu/onedark.nvim' },
    { src = gh 'sainnhe/gruvbox-material' },
    { src = gh 'vim-airline/vim-airline',  type = "opt" },
})

-- :packadd vim-airline to activate an opt/ional plugin

-- require('smear_cursor').setup({})

require('onedark').setup({ style = 'darker' })
vim.cmd('colorscheme gruvbox-material')
-- vim.cmd('hi statusline guibg=NONE')

--[[
=============================   LANGUAGE   =============================
--]]

vim.pack.add({
    { src = gh 'numToStr/Comment.nvim' },
    { src = gh 'jiangmiao/auto-pairs' }, -- NOT LUA
    { src = gh 'windwp/nvim-autopairs' },
    { src = gh 'kylechui/nvim-surround' },
    { src = gh 'nvim-treesitter/nvim-treesitter' },
    { src = gh 'mfussenegger/nvim-lint' },
    { src = gh 'neovim/nvim-lspconfig' },
    { src = gh 'saghen/blink.cmp',               version = vim.version.range('<2.*') },
    { src = gh 'lopi-py/luau-lsp.nvim' }
})

require('Comment').setup()
-- require('nvim-autopairs').setup({ map_cr = true })
require('nvim-surround').setup()
require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<TAB>'] = { 'select_and_accept' },
    },
    completion = {
        documentation = { auto_show = true }
    },
})

require("luau-lsp").setup({
    types = {
        definition_files = {
            ["@roblox"] = '/home/turt/Documents/Misc/globalTypes.d.luau'
        },
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
})

