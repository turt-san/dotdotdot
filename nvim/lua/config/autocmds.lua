local text_file_group = vim.api.nvim_create_augroup('TextFileGroup', { clear = true })

vim.api.nvim_create_autocmd('BufReadPre', {
    group = text_file_group,
    pattern = { '*.md', '*.txt' },
    callback = function(ev)
        vim.o.textwidth = 0
        vim.o.wrapmargin = 0
        vim.o.linebreak = true
        vim.opt_local.wrap = true

        local function bmap(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = true
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- expr = true is required. it evaluates the return value and executes the string as a keystroke, otherwises it just executes the function directly
        -- bmap({ "n", "v" }, "j", function() return vim.v.count == 0 and "gj" or "j" end, { expr = true })
        -- bmap({ "n", "v" }, "k", function() return vim.v.count == 0 and "gk" or "k" end, { expr = true })
        bmap({ 'n', 'v' }, 'h', 'gh')
        bmap({ 'n', 'v' }, 'j', 'gj')
        bmap({ 'n', 'v' }, 'k', 'gk')
        bmap({ 'n', 'v' }, 'l', 'gl')

        bmap({ 'n', 'v' }, '$', 'g$')
        bmap({ 'n', 'v' }, '^', 'g^')
        bmap({ 'n', 'v' }, '0', 'g0')

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
