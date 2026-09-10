return {
    {
        "tiagovla/tokyodark.nvim",
        lazy = true,
    },
    {
        "catppuccin/nvim",
        lazy = true,
    },
    {
        "navarasu/onedark.nvim",
        opts = { style = "warm" },
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("onedark")
            vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
            vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
            vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
            vim.cmd("highlight LineNr guibg=NONE ctermbg=NONE")
            vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        lazy = true,
    },
}
