return {
    'vim-airline/vim-airline',
    lazy = false,
    config = function()
        vim.cmd([[let g:airline#extensions#tabline#enabled = 1]])
        vim.cmd([[let g:airline#extensions#tabline#formatter = 'unique_tail_improved']])
    end,
}
