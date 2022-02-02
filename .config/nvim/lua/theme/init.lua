-- theme

-- To fix comments, autocmds are needed which are not yet added

--function fixComments()
--    vim.cmd "highlight Comment ctermfg=red guifg=blue"
--end
--
--vim.fn.define_augroup("ExampleGroup", true)
--    vim.fn.define_autocmd(
--        {"ColorScheme"},
--        "*",
--        {on_event = function() fixComments() end},
--        {group = "ExampleGroup"}
--    )

-- 

-- Coloring and syntax highlighting
vim.opt.colorcolumn = "100"
require("onedark").setup{
    transparent = true
}
vim.cmd "highlight Comment ctermfg=cyan guifg=#30a58e"

-- Indent blankline settings
vim.g.indent_blankline_use_treesitter = true
--vim.g.indent_blankline_show_current_context = true -- buggy

-- Load the nvim tree config
require("theme.tree")

