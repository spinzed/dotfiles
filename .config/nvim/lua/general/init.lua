-- General


-- Shortcuts
local cmd = vim.cmd  -- to execute Vim commands e.vim.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.vim.g. fn.g.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options


-- General
--cmd "syntax on" -- for some reason, doesn't work with filetype.nvim
g.mapleader = " "
opt.encoding = "utf-8"
opt.wildmode = {"longest", "list", "full"}
opt.errorbells = false
opt.splitbelow = true
opt.splitright = true
opt.number = true
opt.wrap = false
opt.showcmd = true -- show currently inputed letters in normal mode
opt.incsearch = true -- improved search mode (alias ic)
opt.ignorecase = true -- same as opt.ic, ignores case on search except if an uppercase letter is passed
opt.hlsearch = false -- remove search highlighting
opt.smartcase = true -- search ignores case if everything is lowercase
opt.swapfile = false -- disable swapfiles (looking for replacement)
opt.undofile = true
opt.termguicolors = true -- needed for bufferline

-- Tabs and indenting
opt.tabstop = 4
opt.softtabstop = 4 -- tab and space indent width
opt.shiftwidth = 4 -- indent on newline
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- apparently, smartindent is a no-no
cmd "filetype plugin indent on"

-- Change indents for js and ts to 2 spaces
vim.api.nvim_command("autocmd Filetype javascript,typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2")

-- Set default syntax highlighting
vim.api.nvim_command("au BufNewFile,BufRead * if &syntax == '' | set syntax=config | endif")

