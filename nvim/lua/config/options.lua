local opt = vim.opt
local o = vim.o
local g = vim.g

local indent_width = 4
local chars = {
    trail = "",
    space = "·",
    tab = "-->",
    -- eol = '¬',
}
-- alt options
local chars_alt = {
    "",
    "•",
    "·",
    "_",
    "¬",
}

opt.number = true
opt.gdefault = true
opt.relativenumber = true
opt.wrap = false
opt.signcolumn = "yes"
opt.ignorecase = true

g.mapleader = " "

opt.shiftwidth = indent_width
opt.tabstop = indent_width
opt.softtabstop = indent_width
opt.expandtab = true
opt.listchars = chars
opt.fillchars = { eob = " " }
opt.list = true
