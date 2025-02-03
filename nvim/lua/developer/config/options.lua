vim.g.mapleader = " "
local opt = vim.opt
opt.autowrite = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.cursorline = true
opt.expandtab = true

opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
