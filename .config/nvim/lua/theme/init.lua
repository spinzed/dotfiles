-- theme

-- Coloring and syntax highlighting
vim.opt.colorcolumn = "100"
require("onedark").setup{
    style = 'darker',
--    transparent = true
}
require("onedark").load();
vim.cmd "highlight Comment ctermfg=cyan guifg=#30a58e"

-- Indent blankline settings
 require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}

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

