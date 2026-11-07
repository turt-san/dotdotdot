local opt = vim.opt
local o = vim.o
local g = vim.g

local indent_width = 4
local chars = {
    trail = '',
    -- space = "·",
    tab = '-->',
    -- eol = '¬',
}
-- alt options
local chars_alt = {
    '',
    '•',
    '·',
    '_',
    '¬',
}

-- changes the default behaviour from backupcopy = 'auto' (which is usually 'no'), which does the following, assuming writebackup is true:
-- renames the source file to the vim-specific backup name
-- writes a new file with the same name as the source file at the same path
-- this technically creates a new file, with a different inode
-- which breaks some file watcher setups since they watch the files inode
-- backupcopy = 'yes' instead copies the source file to the backup file and writes the source file in place
o.backupcopy = 'yes'

opt.number = true
opt.gdefault = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = 'yes'
opt.ignorecase = true

g.mapleader = ' '

opt.shiftwidth = indent_width
opt.tabstop = indent_width
opt.softtabstop = indent_width
opt.expandtab = true
opt.listchars = chars
opt.fillchars = { eob = ' ' }
opt.list = true
