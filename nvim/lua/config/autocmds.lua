local text_file_group = vim.api.nvim_create_augroup('TextFileGroup', { clear = true })

vim.api.nvim_create_autocmd('BufReadPre', {
    group = text_file_group,
    pattern = { '*.md', '*.txt' },
    callback = function(ev)
        vim.o.textwidth = 0
        vim.o.wrapmargin = 0
        vim.wo.wrap = true
        vim.o.linebreak = true
        print('Opened .md file' .. ev.file)
    end,
})

-- Automatically soft-wrap text (only visually) at the edge of the window:
-- set number # (optional - will help to visually verify that it's working)
-- set textwidth=0
-- set wrapmargin=0
-- set wrap
-- set linebreak # (optional - breaks by word rather than character)

-- Automatically hard-wrap text (by inserting a new line into the actual text file) at 80 columns:
-- set number # (optional - will help to visually verify that it's working)
-- set textwidth=80
-- set wrapmargin=0
-- set formatoptions+=t
-- set linebreak # (optional - breaks by word rather than character)

-- Automatically soft-wrap text (only visually) at 80 columns:
-- set number # (optional - will help to visually verify that it's working)
-- set textwidth=0
-- set wrapmargin=0
-- set wrap
-- set linebreak # (optional - breaks by word rather than character)
-- set columns=80 # <<< THIS IS THE IMPORTANT PART
