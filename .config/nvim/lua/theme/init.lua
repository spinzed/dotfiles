-- theme

-- Coloring and syntax highlighting
vim.opt.colorcolumn = "100"
require("onedark").setup{
    style = 'darker',
--    transparent = true
}
require("onedark").load();
vim.cmd "highlight Comment ctermfg=cyan guifg=#30a58e"

-- Bufferline
require("bufferline").setup{
    options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left"
            }
        }
    }
}


-- Load the nvim tree config
require("theme.tree")

