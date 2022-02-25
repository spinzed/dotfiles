-- theme

-- Coloring and syntax highlighting
vim.opt.colorcolumn = "100"
require("onedark").setup{
    --style = 'darker',
    transparent = true
}
require("onedark").load();
vim.cmd "highlight Comment ctermfg=cyan guifg=#30a58e"

-- Indent blankline settings
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false;

-- Load the nvim tree config
require("theme.tree")

