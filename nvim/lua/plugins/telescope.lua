return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    lazy = false,
    opts = {},
    dependencies = {
        {
            'nvim-lua/plenary.nvim',
            lazy = true,
        },
    },
}
